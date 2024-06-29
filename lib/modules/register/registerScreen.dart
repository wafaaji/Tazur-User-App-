import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customIconButton.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/register/components/loginButton.dart';
import 'package:graduation_project/modules/register/components/registerForm.dart';
import 'package:graduation_project/modules/register/components/registerTitle.dart';
import 'package:graduation_project/modules/register/registerController.dart';

class RegisterScreen extends GetView<RegisterController> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryWhiteColor,
        leading: CustomIconButton(
          onPressed: (){
            Get.toNamed('/auth');
          },
          icon: Icons.arrow_back,
          size: 20,
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RegisterTitle(),
                    RegisterForm(
                      registerFormKey: registerFormKey,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 2200),
                      child: CustomElevatedButton(
                        onPressed: (){
                          final isValid = registerFormKey.currentState!.validate();
                          if (isValid) {
                            onClickRegister();
                            //Get.offNamed('/pinCode');
                          }
                        },
                        text: 'register'.tr,
                      ),
                    ),
                    LoginButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  // For Register Button
  void onClickRegister() async{
    CustomEasyLoading.showLoading();

    await controller.registerOnClick();
    CustomEasyLoading.dismiss();

    if(controller.registerStatus){
      CustomEasyLoading.showSuccess(controller.message);
      Get.toNamed("/pinCode", arguments: controller.email);
    }else{
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}
