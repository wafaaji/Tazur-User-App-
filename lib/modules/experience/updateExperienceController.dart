import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/experienceModel.dart';
import 'package:graduation_project/model/updateExperienceModel.dart';
import 'package:graduation_project/modules/experience/updateExperienceService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class UpdateExperienceController extends GetxController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;
  var experienceId = Get.arguments['experienceId'];
  var message;

  // Update Experience
  late TextEditingController experienceNameController, companyNameController, jobTitleController, experienceDetailsController;
  var experienceName = ''.obs;
  var companyName = ''.obs;
  var jobTitle = ''.obs;
  var experienceDetails = ''.obs;
  Rx<DateTime?> startDateExperience = Rx<DateTime?>(null);
  Rx<DateTime?> endDateExperience = Rx<DateTime?>(null);
  late UpdateExperienceService updateExperienceService;
  var updateExperienceStatus = false;

  @override
  void onInit() {
    updateExperienceService = UpdateExperienceService();
    experienceNameController = TextEditingController(text: experienceName.value);
    companyNameController = TextEditingController(text: companyName.value);
    jobTitleController = TextEditingController(text: jobTitle.value);
    experienceDetailsController = TextEditingController(text: experienceDetails.value);

    fetchExperience();
    print(experienceId);
    super.onInit();
  }

  void fetchExperience() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var experienceInfo = await updateExperienceService.fetchExperience(token, experienceId);

    if (experienceInfo != null) {
      var experienceData = experienceInfo['experiences'];
      experienceName.value = experienceData['name'] ?? 'experience name'.tr;
      companyName.value = experienceData['company_name'] ?? 'company name'.tr;
      jobTitle.value = experienceData['job_title'] ?? 'job title'.tr;
      experienceDetails.value = experienceData['details'] ?? 'experience details'.tr;

      // Convert start and end date strings to DateTime objects
      String? startDateString = experienceData['start_date'];
      String? endDateString = experienceData['end_date'];
      DateTime? startDate = startDateString != null ? DateTime.parse(startDateString) : null;
      DateTime? endDate = endDateString != null ? DateTime.parse(endDateString) : null;

      // Assign converted start and end dates to Rx<DateTime?> variables
      startDateExperience.value = startDate;
      endDateExperience.value = endDate;

      experienceNameController.text = experienceName.value;
      companyNameController.text = companyName.value;
      jobTitleController.text = jobTitle.value;
      experienceDetailsController.text = experienceDetails.value;

      isLoading.value = false;
      print('Experience Name:' + experienceName.value);
      print('Company Name:' + companyName.value);
      print('Job Title:' + jobTitle.value);
      print('Experience Details:' + experienceDetails.value);
      print('Start Date:' + startDateExperience.value.toString());
      print('End Date:' + endDateExperience.value.toString());
    }
  }

  // Update Experience API
  Future<void> UpdateExperience() async {
    experienceName.value = experienceNameController.text;
    companyName.value = companyNameController.text;
    jobTitle.value = jobTitleController.text;
    experienceDetails.value = experienceDetailsController.text;
    try {
      var token = await storage.read("token");
      UpdateExperienceModel updateExperience = UpdateExperienceModel(
        experiences: Experiences(
          companyName: companyName.value,
          jobTitle: jobTitle.value,
          name: experienceName.value,
          details: experienceDetails.value,
          startDate: startDateExperience.toString(),
          endDate: endDateExperience.toString(),
        ),
      );

      updateExperienceStatus = await updateExperienceService.UpdateExperience(token, updateExperience, experienceId);
      message = updateExperienceService.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error updating experience: $e");
      message = 'error updating experience: $e'.tr;
    }
  }

}