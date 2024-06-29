import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/registerModel.dart';
import 'package:graduation_project/modules/register/registerService.dart';

class RegisterController extends GetxController {

  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController emailController , phoneController, passwordController, confirmPasswordController;
  var email = '';
  var phone = '';
  var password = '';
  var confirmPassword = '';
  RxBool isPassword = true.obs;
  RxBool isConfirmPassword = true.obs;

  // For Register API
  late RegisterService service;
  var registerStatus;
  var message;

  @override
  void onInit(){
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    service = RegisterService();
    registerStatus = false;
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
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'empty phone'.tr;
    } else if (value.length != 10) {
      return 'phone length'.tr;
    } else if (!value.contains(RegExp(r'^[0-9]+$'))) {
      return 'phone content'.tr;
    } else if (!value.startsWith('09')) {
      return 'phone start'.tr;
    }
    return null;
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

  // Register API
  Future<void> registerOnClick() async{
    email = emailController.text;
    phone = phoneController.text;
    password = passwordController.text;
    confirmPassword = confirmPasswordController.text;
    RegisterModel register = RegisterModel(
      email: email,
      phone: phone,
      password: password,
      password_confirmation: confirmPassword,
    );
    print("______________Register Controller________________");
    registerStatus = await service.register(register);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}