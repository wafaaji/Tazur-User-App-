import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/applyModel.dart';
import 'package:http/http.dart' as http;

class JobApplyService {

  var message;

  Future<bool> JobApply(var token, int jobId, ApplyModel JobApply) async{
    print("Questions: ${JobApply.questions}");
    var response = await http.post(
      Uri.parse('${ServerConfig.domainNameServer}${ServerConfig.jobApply}/$jobId'),
      headers: {
        'Accept' : 'application/json',
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "questions" : JobApply.questions,
       },
      ),
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      // message = jsonResponse["message"];
      message = 'apply successfully'.tr;
      token = jsonResponse["token"];
      print('-----------------------------------------------------------------');
      print('------service------' + message);
      return true;
    }else if (response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      message = 'apply error'.tr;
      return false;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}