import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/model/forgetPasswordNewPassword.dart';
import 'package:graduation_project/modules/forget-password/forget-password-second-step/forgetPasswordNewPasswordService.dart';

class ForgetPasswordSecondStepController extends GetxController {
  late TextEditingController passwordController, confirmPasswordController;
  var password = '';
  var confirmPassword = '';
  var email = '';
  RxBool isPassword = true.obs;
  RxBool isConfirmPassword = true.obs;

  // for new password api
  late ForgetPasswordNewPasswordService service;
  var forgetPasswordNewPasswordStatus;
  var message;

  //for get email
  ForgetPasswordSecondStepController(this.email);

  @override
  void onInit(){
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    service = ForgetPasswordNewPasswordService();
    forgetPasswordNewPasswordStatus = false;
    message = '';

    super.onInit() ;
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();

    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String? validatePassword (String value) {
    if (value.isEmpty) {
      return 'empty password'.tr;
    } else if (value.length < 8) {
      return 'password valid'.tr;
    }
    {
      return null;
    }
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'empty confirm password'.tr;
    } else if (password != confirmPassword) {
      return 'Passwords do not match'.tr;
    }
    return null;
  }


  void changePassword (){
    isPassword.value = !isPassword.value;
    update();
  }

  void changeConfirmPassword (){
    isConfirmPassword.value = !isConfirmPassword.value;
    update();
  }

  // Forget Password New Password API
  Future<void> ForgetPasswordNewPasswordOnClick() async{
    password = passwordController.text;
    confirmPassword = confirmPasswordController.text;
    ForgetPasswordNewPasswordModel forgetPasswordNewPassword = ForgetPasswordNewPasswordModel(
      email: email,
    password: password,
    password_confirmation: confirmPassword,
    );
    print("______________Forget Password New Password Controller________________");
    forgetPasswordNewPasswordStatus = await service.ForgetPasswordNewPassword(forgetPasswordNewPassword);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }


}