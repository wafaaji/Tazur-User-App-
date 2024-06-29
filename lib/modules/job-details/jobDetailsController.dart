import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/model/applyModel.dart';
import 'package:graduation_project/model/jobDetailsModel.dart';
import 'package:graduation_project/model/questionModel.dart';
import 'package:graduation_project/modules/job-details/jobApplyService.dart';
import 'package:graduation_project/modules/job-details/jobDetailsService.dart';
import 'package:graduation_project/modules/job-details/jobQuestionsService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class JobDetailsController extends GetxController {

  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  final PageController pageController = PageController(initialPage: 0);

  void onPageChanged(int index) {
    _currentIndex.value = index;
  }

  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  SecureStorage storage = SecureStorage();
  // Variable to store the jobId
  RxInt jobId = 0.obs;

  // For Job Details API
  late JobDetailsService detailsService;
  Rx<JobDetailsModel?> jobDetails = Rx<JobDetailsModel?>(null);

  // For Apply API
  late JobApplyService service;
  var applyStatus;
  var message;

  @override
  void onInit() {
    detailsService = JobDetailsService();
    serviceDisplay = JobQuestionsService();
    service = JobApplyService();
    applyStatus = false;
    message = '';
    fetchJobDetails();
    fetchData();
    processJobDetails(Get.arguments);
    print('Received job id: $jobId');
    super.onInit();
  }

  void fetchJobDetails() async {
    try {
      var token = await storage.read("token");
      final details = await detailsService.displayJobDetails(token!, jobId.value);
      jobDetails.value = details;
    } catch (e) {
      print('Error fetching job details: $e');
    }
  }

  // Example method in the controller that receives arguments
  void processJobDetails(int jobId) {
    this.jobId.value = jobId;
    print('Received job id: $jobId');
  }

  // For Questions API
  late JobQuestionsService serviceDisplay;
  var QuestionsList = <QuestionModel>[].obs;
  late List<QuestionModel> newQuestions = [];
  var isLoading = true.obs;

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      var token = await storage.read("token");
      print(token);
      var fetchedQuestions = await serviceDisplay.displayJobQuestions(token, jobId.value);
      QuestionsList.value = fetchedQuestions;
        } catch (e) {
      print("Error fetching questions: $e");
    }

    isLoading.value = false;
  }

  // For Store Answer And Apply API
  // Map to store selected answer IDs for each question
  final selectedAnswers = <int, int>{}.obs;

  // Method to update selected answer for a question
  void updateSelectedAnswer(int questionId, int answerId) {
    selectedAnswers[questionId] = answerId;
  }

  // Method to check if all questions are answered
  bool allQuestionsAnswered() {
    return selectedAnswers.length == QuestionsList.length;
  }

  // Method to apply for job
  bool applyJob() {
    if (!allQuestionsAnswered()) {
      Get.snackbar(
        'error'.tr,
        'you should answer all questions'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: primaryWhiteColor,
      );
      return false;
    }
    return true;
  }

  void printQuestionsWithAnswers() {
    for (QuestionModel question in QuestionsList) {
      int selectedAnswerId = selectedAnswers[question.id] ?? -1; // Get selected answer ID or -1 if not found
      Option? selectedOption = question.options.firstWhereOrNull((option) => option.id == selectedAnswerId);
      String selectedAnswerText = selectedOption != null ? selectedOption.optionText : 'Not answered';

      print('Question: ${question.question}');
      print('Selected Answer: $selectedAnswerText');
      print('-------------------------');
    }
  }

  // For Apply API
  Future<void> applyOnClick() async{
    List<Question> questions = [];

    // Iterate over each question and its selected answer
    for (QuestionModel question in QuestionsList) {
      int selectedAnswerId = selectedAnswers[question.id] ?? -1; // Get selected answer ID or -1 if not found

      // Create a Question object with the question id and selected answer id
      Question q = Question(
        id: question.id,
        answerId: selectedAnswerId,
      );

      // Add the Question object to the list of questions
      questions.add(q);
    }


    ApplyModel apply = ApplyModel(
      questions: questions,
    );
    print("______________Apply Controller________________");
    // Print the ApplyModel object for debugging
    print(apply.toJson());

    var token = await storage.read("token");
    print(token);
    applyStatus = await service.JobApply(token, jobId.value, apply);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}