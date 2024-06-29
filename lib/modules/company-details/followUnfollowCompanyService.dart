import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/followUnfollowCompanyModel.dart';
import 'package:http/http.dart' as http;

class FollowUnfollowCompanyService {

  var message;

  Future<bool> followUnfollowCompany(var token, int companyId, FollowUnfollowCompanyModel followUnfollowCompany) async{
    var response = await http.post(
      Uri.parse('${ServerConfig.domainNameServer}${ServerConfig.followUnfollowCompany}/$companyId'),
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
      message = 'follow successfully';
      token = jsonResponse["token"];
      print('-----------------------------------------------------------------');
      print('------service------' + message);
      return true;
    }else{
      message = 'server error'.tr;
      return false;
    }

  }

}