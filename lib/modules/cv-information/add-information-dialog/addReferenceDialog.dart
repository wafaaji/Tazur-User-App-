import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';

void AddReferenceDialog({
  required TextEditingController referenceNameController,
  required TextEditingController employmentController,
  required TextEditingController referenceEmailController,
  required TextEditingController referencePhoneController,
  required VoidCallback addReferenceOnPressed,
}) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: CustomText(
          text: 'add reference'.tr,
          color: primaryBlackColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Reference Name
                  CustomTextField(
                    height: 50.0,
                    controller: referenceNameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'reference name'.tr,
                    ),
                    hintSize: 14.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Employment
                  CustomTextField(
                    height: 50.0,
                    controller: employmentController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'employment'.tr,
                    ),
                    hintSize: 14.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Reference Email
                  CustomTextField(
                    height: 50.0,
                    controller: referenceEmailController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'reference email'.tr,
                    ),
                    hintSize: 14.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Reference Phone
                  CustomTextField(
                    height: 50.0,
                    controller: referencePhoneController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'reference phone'.tr,
                    ),
                    hintSize: 14.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                onPressed: addReferenceOnPressed,
                text: 'add reference'.tr,
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
        ],
      );
    },
  );
}