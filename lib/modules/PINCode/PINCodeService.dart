import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/PINCodeModel.dart';
import 'package:http/http.dart' as http;

class PINCodeService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.pinCode);

  Future<bool> PINCode(PINCodeModel PINCode) async{
    print("Email: ${PINCode.email}");
    print("Code: ${PINCode.code}");
    var response = await http.post(
      url,
      headers: {
        'Accept' : 'application/json',
      },
      body: {
        "email" : PINCode.email,
        'code'  : PINCode.code,
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
      message = 'pin successfully'.tr;
      print('------service------' + message);
      return true;
    }else if (response.statusCode == 400){
      // Remove HTML comment wrapper
      // String jsonString = response.body.replaceAll("<!--", "").replaceAll("-->", "");
      var jsonResponse = jsonDecode(response.body);
      // message = jsonResponse["message"];
      message = 'pin error'.tr;
      return false;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}