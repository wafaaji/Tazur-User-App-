import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/loginModel.dart';
import 'package:graduation_project/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class LoginService {

  var message;
  var token;
  var emailVerifiedAt;
  var completeState;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);

  Future<bool> login(LoginModel login) async{
    print("Email: ${login.email}");
    print("Password: ${login.password}");
    var response = await http.post(
      url,
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        "email" : login.email,
        "password" : login.password,
      },
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      // Remove HTML comment wrapper
      //String jsonString = response.body.replaceAll("<!--", "").replaceAll("-->", "");
      //take json and make it var
      var jsonResponse = jsonDecode(response.body);
      // message = jsonResponse["message"];
      message = 'login successfully'.tr;
      token = jsonResponse["token"];
      emailVerifiedAt = jsonResponse["user"]["email_verified_at"];
      completeState = jsonResponse["user"]["complete_state"];
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
      // message = jsonResponse["message"];
      message = 'login email error'.tr;
      return false;
    }else if (response.statusCode == 402){
      // Remove HTML comment wrapper
      String jsonString = response.body.replaceAll("<!--", "").replaceAll("-->", "");
      var jsonResponse = jsonDecode(jsonString);
      // message = jsonResponse["message"];
      message = 'login password error'.tr;
      return false;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}