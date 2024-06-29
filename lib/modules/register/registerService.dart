import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/registerModel.dart';
import 'package:graduation_project/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class RegisterService {

  var message;
  var token;
  var emailVerifiedAt;
  var completeState;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);

  Future<bool> register(RegisterModel register) async{
    print("Email: ${register.email}");
    print("Phone: ${register.phone}");
    print("Password: ${register.password}");
    print("Confirm Password: ${register.password_confirmation}");
    var response = await http.post(
      url,
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        "email" : register.email,
        'phone' : register.phone,
        "password" : register.password,
        'password_confirmation' : register.password_confirmation
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
      message = 'register successfully'.tr;
      token = jsonResponse["token"];
      emailVerifiedAt = jsonResponse["user"][0]["email_verified_at"];
      completeState = jsonResponse["user"][0]["complete_state"];
      print('-----------------------------------------------------------------');
      print('emailVerifiedAt: ' + (emailVerifiedAt ?? 'null'));
      print('completeState: ' + (completeState?.toString() ?? 'null'));
      SecureStorage storage = SecureStorage();
      await storage.save("token", token);
      await storage.save("emailVerifiedAt", emailVerifiedAt.toString());
      await storage.save("completeState", completeState.toString());
      print('------service------' + message + token);
      return true;
    }else if (response.statusCode == 400){
      // Remove HTML comment wrapper
      // String jsonString = response.body.replaceAll("<!--", "").replaceAll("-->", "");
      var jsonResponse = jsonDecode(response.body);
      //message = jsonResponse["message"];
      message = 'register error'.tr;
      return false;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}