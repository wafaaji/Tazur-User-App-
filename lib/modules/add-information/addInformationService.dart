import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/AddInformationModel.dart';
import 'package:graduation_project/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class AddInformationService {
  var message;
  var emailVerifiedAt;
  var completeState;

  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.addInformation);

  Future<bool> AddInformation(AddInformationModel addInformation) async {
      SecureStorage storage = SecureStorage();
      var token = await storage.read("token");

      print('First Name: ${addInformation.first_name}');
      print('Last Name: ${addInformation.last_name}');
      print('Governorate: ${addInformation.governorate}');
      print('Address: ${addInformation.address}');
      print('Family State: ${addInformation.marital_status}');
      print('Nationality: ${addInformation.nationality}');
      print('Experience Years: ${addInformation.experience_years}');
      print('Education: ${addInformation.education}');
      print('Gender: ${addInformation.gender}');
      print('Driving License: ${addInformation.driving_license}');
      print('Military Status: ${addInformation.military_status}');
      print('Topic: ${addInformation.topic}');
      print('Job Environment: ${addInformation.job_environment}');
      print('Job Time: ${addInformation.job_time}');
      print('Work City: ${addInformation.work_city}');
      print('Current Job: ${addInformation.job_current}');
      print('Birthday: ${addInformation.birthday}');

      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "first_name": addInformation.first_name,
          'last_name': addInformation.last_name,
          'governorate': addInformation.governorate,
          'address': addInformation.address,
          'marital_status': addInformation.marital_status,
          'nationality': addInformation.nationality,
          'experience_years': addInformation.experience_years,
          'education': addInformation.education,
          'gender': addInformation.gender,
          'driving_license': addInformation.driving_license != null
              ? (addInformation.driving_license! ? '1' : '0')
              : null,
          'military_status': addInformation.military_status,
          'topic': addInformation.topic,
          'job_environment': addInformation.job_environment,
          'job_time': addInformation.job_time,
          'work_city': addInformation.work_city,
          'job_current': addInformation.job_current,
          'birthday': addInformation.birthday != null
              ? addInformation.birthday!.toIso8601String()
              : null,
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
        message = 'add information successfully'.tr;
        emailVerifiedAt = jsonResponse["user"]["email_verified_at"];
        completeState = jsonResponse["user"]["complete_state"];
        print('-----------------------------------------------------------------');
        print('emailVerifiedAt: ' + (emailVerifiedAt ?? 'null'));
        print('completeState: ' + (completeState?.toString() ?? 'null'));
        await storage.save("emailVerifiedAt", emailVerifiedAt.toString());
        await storage.save("completeState", completeState.toString());
        return true;
      } else {
        message = 'server error'.tr;
        return false;
      }
  }
}
