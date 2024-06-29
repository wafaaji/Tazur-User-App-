import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';
import 'package:image_picker/image_picker.dart';

void AddTrainingCourseDialog({
  required TextEditingController trainingCourseNameController,
  required TextEditingController sourceController,
  required TextEditingController durationController,
  required TextEditingController trainingCourseDetailsController,
  required Rx<File?> imageFile,
  required Function(File?) updateImageFile,
  required VoidCallback addTrainingCourseOnPressed,
}) {
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      updateImageFile(File(pickedFile.path));
    }
  }

  Get.dialog(
    AlertDialog(
      title: CustomText(
        text: 'add training course'.tr,
        color: primaryBlackColor,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Picker Button
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('pick image'),
            ),
            // Selected Image or Placeholder
            Obx(() {
              return imageFile.value != null
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(imageFile.value!),
              )
                  : SizedBox();
            }),
            // Remaining UI components (Training Course Name, Source, etc.)
            CustomTextField(
              height: 50.0,
              controller: trainingCourseNameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'experience name'.tr,
              ),
              hintSize: 14.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              height: 50.0,
              controller: sourceController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'source'.tr,
              ),
              hintSize: 14.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              height: 50.0,
              controller: durationController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'training course duration'.tr,
              ),
              hintSize: 14.0,
            ),
            SizedBox(height: 10.0),
            CustomTextField(
              height: 50.0,
              controller: trainingCourseDetailsController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'training course details'.tr,
              ),
              hintSize: 14.0,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextButton(
              onPressed: addTrainingCourseOnPressed,
              text: 'add training course'.tr,
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
    ),
  );
}


