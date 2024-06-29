import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/updateBasicInformationModel.dart';
import 'package:http/http.dart' as http;

class BasicInformationService {
  var message;

  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.updateBasicInformation);

  Future<bool> UpdateBasicInformation(var token, UpdateBasicInformationModel updateBasicInformation) async {

    print('Driving License: ${updateBasicInformation.drivingLicense}');
    print('Military Status: ${updateBasicInformation.militaryStatus}');
    print('Education: ${updateBasicInformation.education}');
    print('Experience Years: ${updateBasicInformation.experienceYears}');
    print('Birthday: ${updateBasicInformation.birthday}');
    print('Gender: ${updateBasicInformation.gender}');

    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "driving_license": updateBasicInformation.drivingLicense != null
            ? (updateBasicInformation.drivingLicense! ? '1' : '0')
            : null,
        "military_status": updateBasicInformation.militaryStatus,
        'education': updateBasicInformation.education,
        'experience_years': updateBasicInformation.experienceYears,
        'birthday': updateBasicInformation.birthday != null
            ? updateBasicInformation.birthday!.toIso8601String()
            : null,
        'gender': updateBasicInformation.gender,
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
      message = 'update basic information successfully'.tr;
      print(
          '-----------------------------------------------------------------');
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchBasicInformation(var token,) async {
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
        print('Failed to fetch and update basic information: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching and updating basic information: $e');
      return null;
    }
  }

}