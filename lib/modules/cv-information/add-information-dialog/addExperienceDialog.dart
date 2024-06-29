import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';
import 'package:intl/intl.dart';

void AddExperienceDialog({
  required TextEditingController experienceNameController,
  required TextEditingController companyNameController,
  required TextEditingController jobTitleController,
  required TextEditingController experienceDetailsController,
  required Rx<DateTime?> startDateExperience,
  required Rx<DateTime?> endDateExperience,
  required VoidCallback addExperienceOnPressed,
}) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: CustomText(
          text: 'add experience'.tr,
          color: primaryBlackColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            DateTime? startDate = startDateExperience.value;
            DateTime? endDate = endDateExperience.value;

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Experience Name
                  CustomTextField(
                    height: 50.0,
                    controller: experienceNameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'experience name'.tr,
                    ),
                    hintSize: 14.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Company Name
                  CustomTextField(
                    height: 50.0,
                    controller: companyNameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'company name'.tr,
                    ),
                    hintSize: 14.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Job Title
                  CustomTextField(
                    height: 50.0,
                    controller: jobTitleController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'job title'.tr,
                    ),
                    hintSize: 14.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Experience Details
                  CustomTextField(
                    height: 50.0,
                    controller: experienceDetailsController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'experience details'.tr,
                    ),
                    hintSize: 14.0,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Start Date
                      CustomTextButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: startDate ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            startDateExperience.value = selectedDate;
                            setState(() {}); // Rebuild dialog content
                          }
                        },
                        text: startDate == null
                            ? 'start date'.tr
                            : 'Start Date: \n${DateFormat('yyyy-MM-dd').format(startDate)}',
                        color: orangeColor,
                      ),
                      // End Date
                      CustomTextButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: endDate ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (selectedDate != null) {
                            endDateExperience.value = selectedDate;
                            setState(() {}); // Rebuild dialog content
                          }
                        },
                        text: endDate == null
                            ? 'end date'.tr
                            : 'End Date: \n${DateFormat('yyyy-MM-dd').format(endDate)}',
                        color: orangeColor,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextButton(
            onPressed: () {
              addExperienceOnPressed(); // Call the callback to add experience
            },
            text: 'add experience'.tr,
            color: primaryGreenColor,
          ),
          CustomTextButton(
            onPressed: () {
              Get.back();
            },
            text: 'cancel button'.tr,
            color: primaryGreenColor,
          ),
        ],
      ),
        ]
      );
    },
  );
}