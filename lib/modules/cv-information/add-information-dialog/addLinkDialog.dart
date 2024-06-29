import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';

void AddLinkDialog({
  required TextEditingController linkTitleController,
  required TextEditingController linkController,
  required VoidCallback addLinkOnPressed,
}) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: CustomText(
          text: 'add link'.tr,
          color: primaryBlackColor,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Link Title
              CustomTextField(
                height: 50.0,
                controller: linkTitleController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'link title'.tr,
                ),
                hintSize: 14.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              // Link
              CustomTextField(
                height: 50.0,
                controller: linkController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'link'.tr,
                ),
                hintSize: 14.0,
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextButton(
                onPressed: addLinkOnPressed,
                text: 'add link'.tr,
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