import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/sendConsultationModel.dart';
import 'package:http/http.dart' as http;

class SendConsultationService {
  var message;

  Future<bool> SendConsultation(var token, SendConsultationModel sendConsultation) async{
    print("Consultation Topic: ${sendConsultation.consulution.topic}");
    print("Consultation User Message: ${sendConsultation.consulution.userMessage}");
    var url = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.sendConsultation);
    var response = await http.post(
     url,
      headers: {
        'Accept' : 'application/json',
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "topic" : sendConsultation.consulution.topic,
        "message" : sendConsultation.consulution.userMessage,
      },
      ),
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      message = 'send message successfully'.tr;
      print('-----------------------------------------------------------------');
      print('------service------' + message);
      return true;
    }else if (response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      // message = jsonResponse["message"];
      message = '5 message error'.tr;
      return false;
    }else if (response.statusCode == 402) {
      // Remove HTML comment wrapper
      String jsonString = response.body.replaceAll("<!--", "").replaceAll(
          "-->", "");
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