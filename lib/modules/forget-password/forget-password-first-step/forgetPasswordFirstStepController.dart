import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/model/forgetPasswordEmailModel.dart';
import 'package:graduation_project/modules/forget-password/forget-password-first-step/forgetPasswordEmailService.dart';

class ForgetPasswordFirstStepController extends GetxController {
  late TextEditingController emailController;
  var email = '';

  // for forget password email api
  late ForgetPasswordEmailService service;
  var forgetPasswordEmailStatus;
  var message;

  @override
  void onInit(){
    emailController = TextEditingController();

    service = ForgetPasswordEmailService();
    forgetPasswordEmailStatus = false;
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

    emailController.dispose();
  }

  String? validateEmail (String value) {
    if(value.isEmpty){
      return 'empty email'.tr;
    } else if (!GetUtils.isEmail(value))
    {
      return 'email valid'.tr;
    }
    return null;
  }

  // Forget password email API
  Future<void> forgetPasswordEmailOnClick() async{
    email = emailController.text;
    ForgetPasswordEmailModel forgetPasswordEmail = ForgetPasswordEmailModel(
      email: email,
    );
    print("______________Forget Password Email Controller________________");
    forgetPasswordEmailStatus = await service.forgetPasswordEmail(forgetPasswordEmail);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}