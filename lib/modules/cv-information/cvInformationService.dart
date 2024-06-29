import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/updateCVInformationModel.dart';
import 'package:http/http.dart' as http;

class CVInformationService {
  var message;

  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.updateCVInformation);

  Future<bool> UpdateCVInformation(var token, UpdateCvInformationModel updateCVInformation) async {

    print('Experiences: ${updateCVInformation.experiences}');
    print('Training Course: ${updateCVInformation.traningCourse}');
    print('References: ${updateCVInformation.references}');
    print('Links: ${updateCVInformation.links}');
    print('Languages: ${updateCVInformation.languages}');
    print('Skills: ${updateCVInformation.skills}');
    print('Job Field: ${updateCVInformation.jobField}');

    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "experiences": updateCVInformation.experiences,
        "traning_course": updateCVInformation.traningCourse,
        'references': updateCVInformation.references,
        'links': updateCVInformation.links,
        'languages': updateCVInformation.languages,
        'skills': updateCVInformation.skills,
        'job_field': updateCVInformation.jobField,
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
      message = 'update cv information successfully'.tr;
      print(
          '-----------------------------------------------------------------');
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchCVInformation(var token,) async {
    try {
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print('Failed to fetch and update cv information: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching and updating cv information: $e');
      return null;
    }
  }

}