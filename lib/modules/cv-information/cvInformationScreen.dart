import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/multi-select-dropdown/customSelectMultiDropdown.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/modules/cv-information/add-information-dialog/addExperienceDialog.dart';
import 'package:graduation_project/modules/cv-information/add-information-dialog/addLinkDialog.dart';
import 'package:graduation_project/modules/cv-information/add-information-dialog/addReferenceDialog.dart';
import 'package:graduation_project/modules/cv-information/add-information-dialog/addTrainingCourseDialog.dart';
import 'package:graduation_project/modules/cv-information/component/customExperienceCard.dart';
import 'package:graduation_project/modules/cv-information/component/customLinksCard.dart';
import 'package:graduation_project/modules/cv-information/component/customReferenceCard.dart';
import 'package:graduation_project/modules/cv-information/component/customTextFieldCVInformation.dart';
import 'package:graduation_project/modules/cv-information/component/customTrainingCourseCard.dart';
import 'package:graduation_project/modules/cv-information/cvInformationController.dart';

class ProfileCVInformationScreen extends StatelessWidget {
  final CVInformationController controller = Get.put(CVInformationController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'cv information'.tr,
        onPressed: () {
          Get.back();
        },
        isArabic: isArabic,
      ),
      body: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryGreenColor,
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      // Experience
                      CustomElevatedButton(
                        onPressed: () {
                          AddExperienceDialog(
                            experienceNameController: controller
                                .experienceNameController,
                            companyNameController: controller
                                .companyNameController,
                            jobTitleController: controller.jobTitleController,
                            experienceDetailsController: controller
                                .experienceDetailsController,
                            startDateExperience: controller.startDateExperience,
                            endDateExperience: controller.endDateExperience,
                            addExperienceOnPressed: () {
                              onClickAddExperience();
                            },
                          );
                        },
                        text: 'experience'.tr,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomExperienceCard(),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Training Course
                      CustomElevatedButton(
                        onPressed: () async {
                          AddTrainingCourseDialog(
                            trainingCourseNameController: controller
                                .trainingCourseNameController,
                            sourceController: controller.sourceController,
                            durationController: controller.durationController,
                            trainingCourseDetailsController: controller
                                .trainingCourseDetailsController,
                            imageFile: Rx<File?>(controller.selectedImageFile),
                            updateImageFile: (File? file) {
                              controller.selectedImageFile = file;
                            },
                            addTrainingCourseOnPressed: () {
                              onClickAddTrainingCourse();
                            },
                          );
                        },
                        text: 'training course'.tr,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.8,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomTrainingCourseCard(),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Job Field
                      customTextFieldCVInformation(
                        label: 'job field'.tr,
                        controller: controller.jobFieldController,
                        onSaved: (value) {
                          controller.jobField.value = value!;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Skills
                      customTextFieldCVInformation(
                        label: 'skills'.tr,
                        controller: controller.skillsController,
                        onSaved: (value) {
                          controller.skills.value = value!;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Languages
                      CustomSelectMultiDropdown(
                        controller: controller,
                        title: 'languages'.tr,
                        text: 'select languages'.tr,
                        onPressed: () {
                          controller.showMultiSelectLanguages();
                        },
                        widget: Obx((){
                          return Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Wrap(
                              children: controller.selectedLanguagesItems
                                  .map((e) => Chip(
                                label: CustomText(
                                  text: e,
                                  color: primaryBlackColor,
                                  fontSize: 15,
                                ),
                              ))
                                  .toList(),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Reference
                      CustomElevatedButton(
                        onPressed: () {
                          AddReferenceDialog(
                            referenceNameController: controller
                                .referenceNameController,
                            employmentController: controller
                                .employmentController,
                            referenceEmailController: controller
                                .referenceEmailController,
                            referencePhoneController: controller
                                .referencePhoneController,
                            addReferenceOnPressed: () {
                              onClickAddReference();
                            },
                          );
                        },
                        text: 'reference'.tr,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomReferenceCard(),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Links
                      CustomElevatedButton(
                        onPressed: () {
                          AddLinkDialog(
                            linkTitleController: controller.linkTitleController,
                            linkController: controller.linkController,
                            addLinkOnPressed: () {
                              onClickAddLink();
                            },
                          );
                        },
                        text: 'links'.tr,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomLinksCard(),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Update Button
                      CustomElevatedButton(
                        onPressed: () {
                          onClickUpdate();
                        },
                        text: 'update button'.tr,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        );
  }

  // For Update Button
  void onClickUpdate() async {
    CustomEasyLoading.showLoading();

    await controller.UpdateCVInformation();
    CustomEasyLoading.dismiss();

    if (controller.updateCVInformationStatus) {
      CustomEasyLoading.showSuccess(controller.message);
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

  // For Add Experience Button
  void onClickAddExperience() async {
    CustomEasyLoading.showLoading();

    await controller.AddExperienceOnClick();
    CustomEasyLoading.dismiss();

    if (controller.addExperienceStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      Get.back(); // Refresh CV information after adding experience
      await controller.fetchCVInformation();
      // Clear input fields for adding another experience
      controller.experienceNameController.clear();
      controller.companyNameController.clear();
      controller.jobTitleController.clear();
      controller.experienceDetailsController.clear();
      controller.startDateExperience.value = null;
      controller.endDateExperience.value = null;
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

  // For Add Training Course Button
  void onClickAddTrainingCourse() async {

    CustomEasyLoading.showLoading();

      await controller.AddTrainingCourseOnClick();
      CustomEasyLoading.dismiss();

      if (controller.addTrainingCourseStatus) {
        CustomEasyLoading.showSuccess(controller.message);
        Get.back(); // Refresh CV information after adding experience
        await controller.fetchCVInformation();
        // Clear input fields for adding another experience
        controller.trainingCourseNameController.clear();
        controller.sourceController.clear();
        controller.durationController.clear();
        controller.trainingCourseDetailsController.clear();
      //  controller.startDateExperience.value = null;
      } else {
        CustomEasyLoading.showError(controller.message);
        print("Error Here");
      }
    }

  // For Add Reference Button
  void onClickAddReference() async {

    CustomEasyLoading.showLoading();

    await controller.AddReferenceOnClick();
    CustomEasyLoading.dismiss();

    if (controller.addReferenceStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      Get.back(); // Refresh CV information after adding experience
      await controller.fetchCVInformation();
      // Clear input fields for adding another experience
      controller.referenceNameController.clear();
      controller.employmentController.clear();
      controller.referenceEmailController.clear();
      controller.referencePhoneController.clear();
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

  // For Add Link Button
  void onClickAddLink() async {

    CustomEasyLoading.showLoading();

    await controller.AddLinkOnClick();
    CustomEasyLoading.dismiss();

    if (controller.addLinkStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      Get.back(); // Refresh CV information after adding experience
      await controller.fetchCVInformation();
      // Clear input fields for adding another experience
      controller.linkTitleController.clear();
      controller.linkController.clear();
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}