import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customIconButton.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/login/components/loginForm.dart';
import 'package:graduation_project/modules/login/components/registerButton.dart';
import 'package:graduation_project/modules/login/loginController.dart';
import 'package:graduation_project/modules/login/components/loginTitle.dart';

class LoginScreen extends GetView<LoginController> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
                  LoginTitle(),
                  LoginForm(
                      loginFormKey: loginFormKey,
                  ),
                  FadeInUp(
                      duration: Duration(milliseconds: 2200),
                      child: CustomElevatedButton(
                        onPressed: (){
                          final isValid = loginFormKey.currentState!.validate();
                          if (isValid) {
                            //Get.offNamed('/home')
                            onClickLogin();
                          }
                        },
                        text: 'login'.tr,
                      ),
                  ),
                  RegisterButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // For Login Button
  void onClickLogin() async {
    CustomEasyLoading.showLoading();

    await controller.loginOnClick();
    CustomEasyLoading.dismiss();

    if (controller.loginStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      await controller.checkRoute();
      //Get.toNamed('/home');
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

}
