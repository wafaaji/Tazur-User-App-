import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/forgetPasswordNewPassword.dart';
import 'package:http/http.dart' as http;

class ForgetPasswordNewPasswordService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.forgetPasswordNewPassword);

  Future<bool> ForgetPasswordNewPassword(ForgetPasswordNewPasswordModel forgetPasswordNewPassword) async{
    print("Email: ${forgetPasswordNewPassword.email}");
    print("Password: ${forgetPasswordNewPassword.password}");
    print("Password Confirmation: ${forgetPasswordNewPassword.password_confirmation}");
    var response = await http.post(
      url,
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        "email" : forgetPasswordNewPassword.email,
        'password'  : forgetPasswordNewPassword.password,
        'password_confirmation' : forgetPasswordNewPassword.password_confirmation,
      },
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      // Remove HTML comment wrapper
      // String jsonString = response.body.replaceAll("<!--", "").replaceAll("-->", "");
      //take json and make it var
      var jsonResponse = jsonDecode(response.body);
      // message = jsonResponse["message"];
      message = 'reset password'.tr;
      print('------service------' + message);
      return true;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}