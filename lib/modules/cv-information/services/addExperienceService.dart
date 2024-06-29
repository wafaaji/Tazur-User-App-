import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/addExperienceModel.dart';
import 'package:http/http.dart' as http;

class AddExperienceService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.addExperience);

  Future<bool> addExperience(var token, AddExperienceModel addExperience) async {
    print("Company Name: ${addExperience.experiences!.companyName}");
    print("Job Title: ${addExperience.experiences!.jobTitle}");
    print("Start Date: ${addExperience.experiences!.startDate}");
    print("End Date: ${addExperience.experiences!.endDate}");
    print("Experience Name: ${addExperience.experiences!.name}");
    print("Experience Details: ${addExperience.experiences!.details}");

    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "company_name": addExperience.experiences!.companyName,
        "job_title": addExperience.experiences!.jobTitle,
        "start_date": addExperience.experiences!.startDate,
        "end_date": addExperience.experiences!.endDate,
        "name": addExperience.experiences!.name,
        "details": addExperience.experiences!.details,
      }),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = 'add experience successfully'.tr;
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

}