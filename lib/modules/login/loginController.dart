import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/loginModel.dart';
import 'package:graduation_project/modules/login/loginService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class LoginController extends GetxController {
  late TextEditingController emailController , passwordController;
  var email = '';
  var password = '';
  RxBool isPassword = true.obs;

  // for login api
  late LoginService service;
  var loginStatus;
  var message;

  late SecureStorage storage;

  @override
  void onInit(){
    emailController = TextEditingController();
    passwordController = TextEditingController();

    service = LoginService();
    loginStatus = false;
    message = '';

    storage = SecureStorage();

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
    passwordController.dispose();
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


  void changePassword (){
    isPassword.value = !isPassword.value;
    update();
  }


  // Login API
  Future<void> loginOnClick() async{
    email = emailController.text;
    password = passwordController.text;
    LoginModel login = LoginModel(
      email: email,
      password: password,
    );
    print("______________Login Controller________________");
    loginStatus = await service.login(login);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  Future<void> checkRoute() async {
    String? emailVerifiedAt = await storage.read("emailVerifiedAt");
    String? completeState = await storage.read("completeState");

    if (emailVerifiedAt == 'null') {
      // If emailVerifiedAt is null, go to the '/pinCode' screen
      Get.toNamed("/pinCode", arguments: email);
    } else if (completeState == '0') {
      // If completeState is '0', go to the '/addInformation' screen
      Get.toNamed('/addInformation');
    } else {
      // If emailVerifiedAt is not null and completeState is not '0', go to the '/home' screen
      Get.offAllNamed('/home');
    }
  }

}