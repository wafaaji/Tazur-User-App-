import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/interestedModel.dart';
import 'package:http/http.dart' as http;

class CourseInterestedService {

  var message;

  Future<bool> CourseInterested(var token, int courseId, InterestedModel interestedModel) async{
    var response = await http.post(
      Uri.parse('${ServerConfig.domainNameServer}${ServerConfig.courseInterested}/$courseId'),
      headers: {
        'Accept' : 'application/json',
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      },
      body: jsonEncode({},),
    );

    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      // message = jsonResponse["message"];
      message = 'interested successfully'.tr;
      token = jsonResponse["token"];
      print('-----------------------------------------------------------------');
      print('------service------' + message);
      return true;
    }else if (response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);
      message = 'interested error'.tr;
      return false;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}