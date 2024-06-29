import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/model/addExperienceModel.dart';
import 'package:graduation_project/model/addLinkModel.dart';
import 'package:graduation_project/model/addReferenceModel.dart';
import 'package:graduation_project/model/addTrainingCourseModel.dart';
import 'package:graduation_project/model/experienceModel.dart';
import 'package:graduation_project/model/updateCVInformationModel.dart';
import 'package:graduation_project/modules/cv-information/cvInformationService.dart';
import 'package:graduation_project/modules/cv-information/services/addExperienceService.dart';
import 'package:graduation_project/modules/cv-information/services/addLinkService.dart';
import 'package:graduation_project/modules/cv-information/services/addReferenceService.dart';
import 'package:graduation_project/modules/cv-information/services/addTrainingCourseService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';
import 'package:graduation_project/model/userLinkModel.dart';
import 'package:graduation_project/model/referenceModel.dart';
import 'package:graduation_project/model/trainingCourseModel.dart';

class CVInformationController extends BaseController {
  SecureStorage storage = SecureStorage();
  var message;
  late TextEditingController jobFieldController, skillsController;
  var jobField = ''.obs;
  var skills = ''.obs;
  var isLoading = true.obs;
  RxList<dynamic> experiences = [].obs;
  RxList<dynamic> trainingCourse = [].obs;
  RxList<dynamic> reference = [].obs;
  RxList<dynamic> links = [].obs;

  // Add Experience
  late TextEditingController experienceNameController, companyNameController, jobTitleController, experienceDetailsController;
  var experienceName = '';
  var companyName = '';
  var jobTitle = '';
  var experienceDetails = '';
  Rx<DateTime?> startDateExperience = Rx<DateTime?>(null);
  Rx<DateTime?> endDateExperience = Rx<DateTime?>(null);
  late AddExperienceService addExperienceService;
  var addExperienceStatus = false;

  // Add Training Course
  late TextEditingController trainingCourseNameController, sourceController, durationController, trainingCourseDetailsController;
  var trainingCourseName = '';
  var source = '';
  var duration = '';
  var trainingCourseDetails = '';
  late AddTrainingCourseService addTrainingCourseService;
  var addTrainingCourseStatus = false;
  File? selectedImageFile;

  // Add Reference
  late TextEditingController referenceNameController, employmentController, referenceEmailController, referencePhoneController;
  var referenceName = '';
  var employment = '';
  var referenceEmail = '';
  var referencePhone = '';
  late AddReferenceService addReferenceService;
  var addReferenceStatus = false;

  // Add Link
  late TextEditingController linkTitleController, linkController;
  var linkTitle = '';
  var link = '';
  late AddLinkService addLinkService;
  var addLinkStatus = false;

  // for update cv information api
  late CVInformationService service;
  var updateCVInformationStatus = false;

  @override
  void onInit() {
    service = CVInformationService();
    jobFieldController = TextEditingController(text: jobField.value);
    skillsController = TextEditingController(text: skills.value);

    fetchCVInformation();

    experienceNameController = TextEditingController();
    companyNameController = TextEditingController();
    jobTitleController = TextEditingController();
    experienceDetailsController = TextEditingController();
    addExperienceService = AddExperienceService();

    trainingCourseNameController = TextEditingController();
    sourceController = TextEditingController();
    durationController = TextEditingController();
    trainingCourseDetailsController = TextEditingController();
    addTrainingCourseService = AddTrainingCourseService();

    referenceNameController = TextEditingController();
    employmentController = TextEditingController();
    referenceEmailController = TextEditingController();
    referencePhoneController = TextEditingController();
    addReferenceService = AddReferenceService();

    linkTitleController = TextEditingController();
    linkController = TextEditingController();
    addLinkService = AddLinkService();
    super.onInit();
  }

  @override
  void onClose() {
    jobFieldController.dispose();
    skillsController.dispose();

    experienceNameController.dispose();
    companyNameController.dispose();
    jobTitleController.dispose();
    experienceDetailsController.dispose();

    trainingCourseNameController.dispose();
    sourceController.dispose();
    durationController.dispose();
    trainingCourseDetailsController.dispose();

    referenceNameController.dispose();
    employmentController.dispose();
    referenceEmailController.dispose();
    referencePhoneController.dispose();

    linkTitleController.dispose();
    linkController.dispose();
    super.onClose();
  }

  Future<void> fetchCVInformation() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var cvInfo = await service.fetchCVInformation(token);

    if (cvInfo != null) {
      jobField.value = cvInfo['job_field'] ?? 'job field'.tr;
      skills.value = cvInfo['skills'] ?? 'skills'.tr;
      List<dynamic>? languagesList = cvInfo['languages'];

      jobFieldController.text = jobField.value;
      skillsController.text = skills.value;
      if (languagesList != null) {
        List<String> translatedLanguages = languagesList.map((languages) => translateValue(languages)).toList();
        setSelectedLanguagesItems(translatedLanguages);
      }
      if (cvInfo['experiences'] != null) {
        experiences.value = cvInfo['experiences'];
      }
      if (cvInfo['traning_course'] != null) {
        trainingCourse.value = cvInfo['traning_course'];
      }
      if (cvInfo['references'] != null) {
        reference.value = cvInfo['references'];
      }
      if (cvInfo['links'] != null) {
        links.value = cvInfo['links'];
      }
      // Update UI after fetching CV information
      isLoading.value = false;
    }
  }

  String translateValue(String value) {
    final Map<String, String> arabicToEnglish = {
      'العربية': 'Arabic', 'الانجليزية': 'English', 'الألمانية': 'German', 'الفرنسية': 'French', 'الإسبانية': 'Spanish', 'الروسية': 'Russian', 'اخرى' : 'Other',
    };

    final Map<String, String> englishToArabic = {
      'Arabic': 'العربية', 'English': 'الانجليزية', 'German': 'الألمانية', 'French': 'الفرنسية', 'Spanish': 'الإسبانية', 'Russian': 'الروسية', 'Other' : 'اخرى',
    };

    if (Get.locale?.languageCode == 'ar') {
      return englishToArabic[value] ?? value;
    } else {
      return arabicToEnglish[value] ?? value;
    }
  }

  // Update CV Information API
  Future<void> UpdateCVInformation() async {
    jobField.value = jobFieldController.text;
    skills.value = skillsController.text;
    try {
      var token = await storage.read("token");
      var updateCVInformation = UpdateCvInformationModel(
        jobField: jobField.value,
        skills: skills.value,
        languages: selectedLanguagesItems,
      );

      updateCVInformationStatus =
      await service.UpdateCVInformation(token, updateCVInformation);
      message = service.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error updating personal information: $e");
      message = 'Error updating personal information: $e'.tr;
    }
  }

// Add Experience API
  Future<void> AddExperienceOnClick() async{
    var token = await storage.read("token");
    experienceName = experienceNameController.text;
    companyName = companyNameController.text;
    jobTitle = jobTitleController.text;
    experienceDetails = experienceDetailsController.text;
    AddExperienceModel addExperience = AddExperienceModel(
      experiences: Experiences(
        companyName: companyName,
        jobTitle: jobTitle,
        name: experienceName,
        details: experienceDetails,
        startDate: startDateExperience.toString(),
        endDate: endDateExperience.toString(),
      ),
    );
    addExperienceStatus = await addExperienceService.addExperience(token, addExperience);
    message = addExperienceService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  // Add Training Course API
  Future<void> AddTrainingCourseOnClick() async{
    var token = await storage.read("token");
    trainingCourseName = trainingCourseNameController.text;
    source = sourceController.text;
    duration = durationController.text;
    trainingCourseDetails = trainingCourseDetailsController.text;
    AddTrainingCourseModel addTrainingCourse = AddTrainingCourseModel(
      trainingCourse: TrainingCourse(
        name: trainingCourseName,
        source: source,
        duration: duration,
        details: trainingCourseDetails,
        image: selectedImageFile.toString(),
      ),
    );
    addTrainingCourseStatus = await addTrainingCourseService.addTrainingCourse(token, addTrainingCourse);
    message = addTrainingCourseService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  // Add Reference API
  Future<void> AddReferenceOnClick() async{
    var token = await storage.read("token");
    referenceName = referenceNameController.text;
    employment = employmentController.text;
    referenceEmail = referenceEmailController.text;
    referencePhone = referencePhoneController.text;
    AddReferenceModel addReference = AddReferenceModel(
      reference: Reference(
        name: referenceName,
        employment: employment,
        email: referenceEmail,
        phone: referencePhone,
      ),
    );
    addReferenceStatus = await addReferenceService.addReference(token, addReference);
    message = addReferenceService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  // Add Link API
  Future<void> AddLinkOnClick() async{
    var token = await storage.read("token");
    linkTitle = linkTitleController.text;
    link = linkController.text;
    AddLinkModel addLink = AddLinkModel(
      link: Link(
        title: linkTitle,
        link: link,
      ),
    );
    addLinkStatus = await addLinkService.addLink(token, addLink);
    message = addLinkService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }
}