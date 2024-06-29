import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/cv-information/component/customTextFieldCVInformation.dart';
import 'package:graduation_project/modules/experience/updateExperienceController.dart';
import 'package:intl/intl.dart';

class UpdateExperienceScreen extends StatelessWidget {
  final UpdateExperienceController controller = Get.put(UpdateExperienceController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'update experience'.tr,
        onPressed: () {
          Get.offNamed('/cvInformation');
        },
        isArabic: isArabic,
      ),
      body: Obx((){
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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                // Experience Name
                customTextFieldCVInformation(
                  label: 'experience name'.tr,
                  controller: controller.experienceNameController,
                  onSaved: (value) {
                    controller.experienceName.value = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                // Company Name
                customTextFieldCVInformation(
                  label: 'company name'.tr,
                  controller: controller.companyNameController,
                  onSaved: (value) {
                    controller.companyName.value = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                // Job Title
                customTextFieldCVInformation(
                  label: 'job title'.tr,
                  controller: controller.jobTitleController,
                  onSaved: (value) {
                    controller.jobTitle.value = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                // Experience Details
                customTextFieldCVInformation(
                  label: 'experience details'.tr,
                  controller: controller.experienceDetailsController,
                  onSaved: (value) {
                    controller.experienceDetails.value = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() =>
                          CustomTextButton(
                            onPressed: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: controller.startDateExperience
                                    .value ?? DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              if (selectedDate != null) {
                                controller.startDateExperience.value =
                                    selectedDate;
                              }
                            },
                            text: 'Start Date: \n${controller.startDateExperience
                                .value != null
                                ? DateFormat('yyyy-MM-dd').format(
                                controller.startDateExperience.value!)
                                : 'start date'.tr}',
                            color: orangeColor,
                          )),
                      // End Date
                      Obx(() =>
                          CustomTextButton(
                            onPressed: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: controller.endDateExperience.value ??
                                    DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              if (selectedDate != null) {
                                controller.endDateExperience.value = selectedDate;
                              }
                            },
                            text: 'End Date: \n${controller.endDateExperience
                                .value != null ? DateFormat('yyyy-MM-dd').format(
                                controller.endDateExperience.value!) : 'end date'
                                .tr}',
                            color: orangeColor,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
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

    await controller.UpdateExperience();
    CustomEasyLoading.dismiss();

    if (controller.updateExperienceStatus) {
      CustomEasyLoading.showSuccess(controller.message);
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}
