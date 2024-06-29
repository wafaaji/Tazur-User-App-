import 'package:get/get.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/model/surveyDetailsModel.dart';
import 'package:graduation_project/model/voteModel.dart';
import 'package:graduation_project/modules/survey-details/surveyDetailsService.dart';
import 'package:graduation_project/modules/survey-details/voteService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class SurveyDetailsController extends GetxController {
  SecureStorage storage = SecureStorage();

  // For Survey Details API
  var selectedOptionIndex = RxInt(-1);
  late SurveyDetailsService detailsService;
  Rx<SurveyDetailsModel?> surveyDetails = Rx<SurveyDetailsModel?>(null);

  // For Vote API
  late VoteService voteService;
  var voteStatus;
  var message;

  // For Survey ID
  RxInt surveyId = 0.obs;

  @override
  void onInit() {
    // For Survey Details API
    detailsService = SurveyDetailsService();
    fetchSurveyDetails();

    // For Vote API
    voteService = VoteService();
    voteStatus = false;
    message = '';

    // For Survey ID
    processSurveyDetails(Get.arguments);
    super.onInit();
  }

  void fetchSurveyDetails() async {
    try {
      var token = await storage.read("token");
      print(token);
      final details = await detailsService.displaySurveyDetails(token!, surveyId.value);
      surveyDetails.value = details;
    } catch (e) {
      print("Error fetching questions: $e");
    }
  }

  void processSurveyDetails(int surveyId) {
    this.surveyId.value = surveyId;
  }

  // Function to handle option selection based on option ID
  void selectOptionById(int optionId) {
    // Find the index of the option with the given ID
    final index = surveyDetails.value!.options.indexWhere((option) => option.id == optionId);
    if (index != -1) {
      // Set the selected option index
      selectedOptionIndex.value = index;
      print(optionId);
    }
  }

  // Function to calculate the percentage of votes for each option
  String calculatePercentage(String voteCount) {
    final totalVotes = surveyDetails.value!.options.fold<int>(
        0, (previousValue, element) => previousValue + int.parse(element.voteCount.toString()));
    final percentage = (int.parse(voteCount) / totalVotes) * 100;
    return percentage.toStringAsFixed(2); // Format percentage to two decimal places
  }

  // For Vote API
  Future<void> voteOnClick() async {
    // Check if any option is selected
    if (selectedOptionIndex.value != -1) {
      // Get the selected option ID
      final selectedOptionId = surveyDetails.value!.options[selectedOptionIndex.value].id;

      // Create a VoteModel with the selected option ID
      VoteModel vote = VoteModel(option_id: selectedOptionId);

      print("______________Vote Controller________________");
      print(vote.toJson());

      var token = await storage.read("token");
      print(token);

      // Show loading indicator
      CustomEasyLoading.showLoading();

      try {
        // Send the vote
        voteStatus = await voteService.Vote(token!, surveyId.value, vote);
        message = voteService.message;

        if (message is List) {
          String temp = '';
          for (String s in message) temp += s + "\n";
          message = temp;
        }

        // Show success message
        CustomEasyLoading.showSuccess(message);
      } catch (e) {
        // Show error message
        CustomEasyLoading.showError(message);
      } finally {
        // Dismiss loading indicator
        CustomEasyLoading.dismiss();
      }
    } else {
      // Handle case when no option is selected
      print("No option selected");
    }
  }

  void updateSurveyDetailsAfterVote() {
    // Copy the current survey details
    var currentDetails = surveyDetails.value!;

    // Remove vote counts from options
    currentDetails.options.forEach((option) {
      option.voteCount = 0; // Or set it to any default value as per your need
    });

    // Update surveyDetails with modified options
    surveyDetails.value = currentDetails;
  }


}
