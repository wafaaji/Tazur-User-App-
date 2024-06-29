import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/cv-information/component/customTextFieldCVInformation.dart';
import 'package:graduation_project/modules/training-course/updateTrainingCourseController.dart';

class UpdateTrainingCourseScreen extends StatelessWidget {
  final UpdateTrainingCourseController controller = Get.put(UpdateTrainingCourseController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'update training course'.tr,
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
                  // Training Course Name
                  customTextFieldCVInformation(
                    label: 'training course name'.tr,
                    controller: controller.trainingCourseNameController,
                    onSaved: (value) {
                      controller.trainingCourseName.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Source
                  customTextFieldCVInformation(
                    label: 'source'.tr,
                    controller: controller.sourceController,
                    onSaved: (value) {
                      controller.source.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Duration
                  customTextFieldCVInformation(
                    label: 'duration'.tr,
                    controller: controller.durationController,
                    onSaved: (value) {
                      controller.duration.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Training Course Details
                  customTextFieldCVInformation(
                    label: 'training course details'.tr,
                    controller: controller.trainingCourseDetailsController,
                    onSaved: (value) {
                      controller.trainingCourseDetails.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Image
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

    await controller.UpdateTrainingCourse();
    CustomEasyLoading.dismiss();

    if (controller.updateTrainingCourseStatus) {
      CustomEasyLoading.showSuccess(controller.message);
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}
