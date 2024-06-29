import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/forget-password/forget-password-second-step/component/forgetPasswordSecondStepForm.dart';
import 'package:graduation_project/modules/forget-password/forget-password-second-step/component/forgetPasswordSecondStepTitle.dart';
import 'package:graduation_project/modules/forget-password/forget-password-second-step/forgetPasswordSecondStepController.dart';

class ForgetPasswordSecondStepScreen extends GetView<ForgetPasswordSecondStepController> {
  final GlobalKey<FormState> forgetPasswordSecondStepFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = Get.arguments;
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
                    ForgetPasswordSecondStepTitle(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Center(
                      child: ForgetPasswordSecondStepForm(
                          forgetPasswordSecondStepFormKey: forgetPasswordSecondStepFormKey
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
                      final isValid = forgetPasswordSecondStepFormKey.currentState!.validate();
                      if (isValid) {
                        // Proceed with the reset process
                        onClickReset();
                      }
                    },
                    text: 'reset button'.tr,
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
  void onClickReset() async{
    CustomEasyLoading.showLoading();

    await controller.ForgetPasswordNewPasswordOnClick();
    CustomEasyLoading.dismiss();

    if(controller.forgetPasswordNewPasswordStatus){
      CustomEasyLoading.showSuccess(controller.message);
      Get.offNamed('/login');
    }else{
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

}
