import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/addExperienceModel.dart';
import 'package:graduation_project/model/addTrainingCourseModel.dart';
import 'package:http/http.dart' as http;

class AddTrainingCourseService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.addTrainingCourse);

  Future<bool> addTrainingCourse(var token, AddTrainingCourseModel addTrainingCourse) async {
    print("Training Course Name: ${addTrainingCourse.trainingCourse!.name}");
    print("Source Name: ${addTrainingCourse.trainingCourse!.source}");
    print("Duration: ${addTrainingCourse.trainingCourse!.duration}");
    print("Image: ${addTrainingCourse.trainingCourse!.image}");
    print("Details: ${addTrainingCourse.trainingCourse!.details}");

    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "name": addTrainingCourse.trainingCourse!.name,
        "source": addTrainingCourse.trainingCourse!.source,
        "duration": addTrainingCourse.trainingCourse!.duration,
        "details": addTrainingCourse.trainingCourse!.details,
        "image": addTrainingCourse.trainingCourse!.image,
      }),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = 'add training course successfully'.tr;
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

}