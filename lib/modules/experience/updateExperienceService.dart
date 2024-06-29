import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/updateExperienceModel.dart';
import 'package:http/http.dart' as http;

class UpdateExperienceService {
  var message;

  Future<bool> UpdateExperience(var token, UpdateExperienceModel updateExperience, int experienceId) async {

    print('Company Name: ${updateExperience.experiences!.companyName}');
    print('Job Title: ${updateExperience.experiences!.jobTitle}');
    print('Start Date: ${updateExperience.experiences!.startDate}');
    print('End Date: ${updateExperience.experiences!.endDate}');
    print('Details: ${updateExperience.experiences!.details}');
    print('Experience Name: ${updateExperience.experiences!.name}');

    var response = await http.post(
      Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
          .updateExperience}/$experienceId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "company_name": updateExperience.experiences!.companyName,
        "job_title": updateExperience.experiences!.jobTitle,
        'start_date': updateExperience.experiences!.startDate,
        'end_date': updateExperience.experiences!.endDate,
        'details': updateExperience.experiences!.details,
        'name': updateExperience.experiences!.name,
      },
      ),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      // Parse JSON
      var jsonResponse = jsonDecode(response.body);
      // Handle response
      message = 'update experience successfully'.tr;
      print(
          '-----------------------------------------------------------------');
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchExperience(var token, int experienceId) async {
    try {
      var response = await http.post(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
            .updateExperience}/$experienceId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print('Failed to fetch and update experience: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching and updating experience: $e');
      return null;
    }
  }

}