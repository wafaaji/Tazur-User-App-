import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/updateTrainingCourseModel.dart';
import 'package:http/http.dart' as http;

class UpdateTrainingCourseService {
  var message;

  Future<bool> UpdateTrainingCourse(var token, UpdateTrainingCourseModel updateTrainingCourse, int trainingCourseId) async {

    print('Training Course Name: ${updateTrainingCourse.trainingCourse!.name}');
    print('Source: ${updateTrainingCourse.trainingCourse!.source}');
    print('Duration: ${updateTrainingCourse.trainingCourse!.duration}');
    print('Image: ${updateTrainingCourse.trainingCourse!.image}');
    print('Details: ${updateTrainingCourse.trainingCourse!.details}');

    var response = await http.post(
      Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
          .updateTrainingCourse}/$trainingCourseId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "name": updateTrainingCourse.trainingCourse!.name,
        "source": updateTrainingCourse.trainingCourse!.source,
        'duration': updateTrainingCourse.trainingCourse!.duration,
        'details': updateTrainingCourse.trainingCourse!.details,
        'image': updateTrainingCourse.trainingCourse!.image,
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
      message = 'update training course successfully'.tr;
      print(
          '-----------------------------------------------------------------');
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchTrainingCourse(var token, int trainingCourseId) async {
    try {
      var response = await http.post(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
            .updateTrainingCourse}/$trainingCourseId'),
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
        print('Failed to fetch and update training course: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching and updating training course: $e');
      return null;
    }
  }

}