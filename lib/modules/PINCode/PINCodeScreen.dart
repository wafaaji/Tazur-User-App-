import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customIconButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/PINCode/PINCodeController.dart';
import 'package:graduation_project/modules/PINCode/component/PINForm.dart';
import 'package:graduation_project/modules/PINCode/component/PINTitle.dart';

class PINCodeScreen extends StatelessWidget {
  PINCodeController controller = Get.put(PINCodeController(Get.arguments));
  final GlobalKey<FormState> PINCodeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = Get.arguments;
    return WillPopScope(
      onWillPop: () async {
        if (Get.previousRoute == '/register') {
          Get.toNamed('/register');
        } else {
          Get.toNamed('/login');
        }
        return false; // Prevent default back navigation
      },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: primaryWhiteColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: primaryWhiteColor,
            leading: CustomIconButton(
              onPressed: (){
                if(Get.previousRoute == '/register'){
                  Get.toNamed('/register');
                } else {
                  Get.toNamed('/login');
                }
              },
              icon: Icons.arrow_back,
              size: 20,
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PINTitle(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomText(
                      text: 'pin direction'.tr,
                      color: primaryBlackColor.withOpacity(0.50),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    PINForm(
                      PINCodeFormKey: PINCodeFormKey,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        onPressed: (){
                          onClickResendPinCode(email);
                        },
                        backgroundColor: primaryWhiteColor,
                        textColor: primaryGreenColor,
                        borderColor: primaryGreenColor,
                        text: 'resend button'.tr,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                      CustomElevatedButton(
                        onPressed: (){
                          final isValid = PINCodeFormKey.currentState!.validate();
                          if (isValid) {
                            onClickPinCode(email);
                          }
                        },
                        text: 'confirm button'.tr,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }

  // For Confirm Button
  void onClickPinCode(String email) async{
    CustomEasyLoading.showLoading();

    await controller.PinCodeOnClick();
    CustomEasyLoading.dismiss();

    if(controller.pinCodeStatus){
      CustomEasyLoading.showSuccess(controller.message);
      if (Get.previousRoute == '/forgetPasswordFirstStep') {
        Get.toNamed('/forgetPasswordSecondStep', arguments: email);
      } else if (Get.previousRoute == '/register' || Get.previousRoute == '/login') {
        Get.offNamed("/addInformation");
      } else {
        return;
      }
    }else{
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

  void onClickResendPinCode(String email) async{
    CustomEasyLoading.showLoading();

    await controller.ResendPinCodeOnClick();
    CustomEasyLoading.dismiss();

    if(controller.resendPINCodeStatus){
      CustomEasyLoading.showSuccess(controller.message);
    }else{
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

}
