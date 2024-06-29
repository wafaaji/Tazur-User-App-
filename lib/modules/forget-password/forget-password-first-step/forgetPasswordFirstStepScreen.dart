import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/forget-password/forget-password-first-step/component/forgetPasswordfirstStepForm.dart';
import 'package:graduation_project/modules/forget-password/forget-password-first-step/component/forgetPasswordfirstStepTitle.dart';
import 'package:graduation_project/modules/forget-password/forget-password-first-step/forgetPasswordFirstStepController.dart';

class ForgetPasswordFirstStepScreen extends GetView<ForgetPasswordFirstStepController> {
  final GlobalKey<FormState> forgetPasswordFirstStepFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded( // Use Expanded to allow the content to occupy remaining space
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ForgetPasswordFirstStepTitle(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: ForgetPasswordFirstStepForm(
                          forgetPasswordFirstStepFormKey: forgetPasswordFirstStepFormKey
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 20), // Add padding to the bottom of the buttons
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    onPressed: (){
                      Get.toNamed('/login');
                    },
                    backgroundColor: primaryWhiteColor,
                    textColor: primaryGreenColor,
                    borderColor: primaryGreenColor,
                    text: 'cancel button'.tr,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  CustomElevatedButton(
                    onPressed: (){
                      final isValid = forgetPasswordFirstStepFormKey.currentState!.validate();
                      if (isValid) {
                       // Get.toNamed('/pinCode');
                        onClickNext();
                      }
                    },
                    text: 'next button'.tr,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // For Next Button
  void onClickNext() async{
    CustomEasyLoading.showLoading();

    await controller.forgetPasswordEmailOnClick();
    CustomEasyLoading.dismiss();

    if(controller.forgetPasswordEmailStatus){
      CustomEasyLoading.showSuccess(controller.message);
      Get.offNamed('/pinCode', arguments: controller.email);
    }else{
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

}
