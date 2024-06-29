import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/resendPINCodeModel.dart';
import 'package:http/http.dart' as http;

class ResendPINCodeService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.resendPINCode);

  Future<bool> ResendPINCode(ResendPinCodeModel ResendPINCode) async{
    print("Email: ${ResendPINCode.email}");
    var response = await http.post(
      url,
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        "email" : ResendPINCode.email,
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
      message = 'resend pin successfully'.tr;
      print('------service------' + message);
      return true;
    }else if (response.statusCode == 400){
      // Remove HTML comment wrapper
      // String jsonString = response.body.replaceAll("<!--", "").replaceAll("-->", "");
      var jsonResponse = jsonDecode(response.body);
      // message = jsonResponse["message"];
      message = 'resend pin error'.tr;
      return false;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}