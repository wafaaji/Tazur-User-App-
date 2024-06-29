import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/updateTargetJobModel.dart';
import 'package:http/http.dart' as http;

class TargetJobService {
  var message;

  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.updateTargetJob);

  Future<bool> UpdateTargetJob(var token, UpdateTargetJobModel updateTargetJob) async {

    print('Topic: ${updateTargetJob.topic}');
    print('Job Environment: ${updateTargetJob.jobEnvironment}');
    print('Job Time: ${updateTargetJob.jobTime}');
    print('Work City: ${updateTargetJob.workCity}');
    print('Job Current: ${updateTargetJob.jobCurrent}');

    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'topic': updateTargetJob.topic,
        'job_environment': updateTargetJob.jobEnvironment,
        'job_time': updateTargetJob.jobTime,
        'work_city': updateTargetJob.workCity,
        'job_current': updateTargetJob.jobCurrent,
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
      message = 'update target job successfully'.tr;
      print('-----------------------------------------------------------------');
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchTargetJob(var token,) async {
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
        print('Failed to fetch and update target job: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching and updating target job: $e');
      return null;
    }
  }

}