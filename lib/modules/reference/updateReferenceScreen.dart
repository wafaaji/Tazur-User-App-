import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/cv-information/component/customTextFieldCVInformation.dart';
import 'package:graduation_project/modules/reference/updateReferenceController.dart';

class UpdateReferenceScreen extends StatelessWidget {
  final UpdateReferenceController controller = Get.put(UpdateReferenceController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'update reference'.tr,
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
                  // Reference Name
                  customTextFieldCVInformation(
                    label: 'reference name'.tr,
                    controller: controller.referenceNameController,
                    onSaved: (value) {
                      controller.referenceName.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Employment
                  customTextFieldCVInformation(
                    label: 'employment'.tr,
                    controller: controller.employmentController,
                    onSaved: (value) {
                      controller.employment.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Reference Email
                  customTextFieldCVInformation(
                    label: 'reference email'.tr,
                    controller: controller.referenceEmailController,
                    onSaved: (value) {
                      controller.referenceEmail.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Reference Phone
                  customTextFieldCVInformation(
                    label: 'reference phone'.tr,
                    controller: controller.referencePhoneController,
                    onSaved: (value) {
                      controller.referencePhone.value = value!;
                    },
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

    await controller.UpdateReference();
    CustomEasyLoading.dismiss();

    if (controller.updateReferenceStatus) {
      CustomEasyLoading.showSuccess(controller.message);
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}
