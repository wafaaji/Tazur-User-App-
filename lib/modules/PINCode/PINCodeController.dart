import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/model/PINCodeModel.dart';
import 'package:graduation_project/model/resendPINCodeModel.dart';
import 'package:graduation_project/modules/PINCode/PINCodeService.dart';
import 'package:graduation_project/modules/PINCode/resendPINCodeService.dart';

class PINCodeController extends GetxController {

  late TextEditingController pin1Controller, pin2Controller, pin3Controller, pin4Controller;
  var pin1 = '';
  var pin2 = '';
  var pin3 = '';
  var pin4 = '';
  var email;

  // for pin api
  late PINCodeService service;
  var pinCodeStatus;
  var message;

  // for resend PIN api
  late ResendPINCodeService resendService;
  var resendPINCodeStatus;


  //for get email
  PINCodeController(this.email);

  @override
  void onInit(){
    pin1Controller = TextEditingController();
    pin2Controller = TextEditingController();
    pin3Controller = TextEditingController();
    pin4Controller = TextEditingController();

    service = PINCodeService();
    pinCodeStatus = false;
    message = '';

    resendService = ResendPINCodeService();
    resendPINCodeStatus = false;

    super.onInit() ;
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    super.onClose();

    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
  }

  String? validatePINCode (String value) {
    if(value.isEmpty){
      return 'empty number'.tr;
    }
    return null;
  }

  // PIN Code API
  Future<void> PinCodeOnClick() async{
    pin1 = pin1Controller.text;
    pin2 = pin2Controller.text;
    pin3 = pin3Controller.text;
    pin4 = pin4Controller.text;

    PINCodeModel pinCode = PINCodeModel(
      code: pin1 + pin2 + pin3 + pin4,
      email: email,
    );
    print("______________PIN Code Controller________________");
    pinCodeStatus = await service.PINCode(pinCode);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

  // Resend PIN Code API
  Future<void> ResendPinCodeOnClick() async{
    ResendPinCodeModel resendPinCode = ResendPinCodeModel(
      email: email,
    );
    print("______________Resend PIN Code Forget Password Controller________________");
    resendPINCodeStatus = await resendService.ResendPINCode(resendPinCode);
    message = resendService.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}
