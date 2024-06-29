import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/courseModel.dart';
import 'package:http/http.dart' as http;

class CoursesService {

  Future<List<Course>> displayCourses(var token, int page) async{
    try {
      var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.courses + '?page=$page'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        //take json and make it var
        var jsonResponse = json.decode(response.body);
        if (jsonResponse != null && jsonResponse["data"] != null) {
          var coursesList = jsonResponse["data"];
          print("-----------------display Courses----------------");
          print(coursesList);

          List<Course> courseList = List<Course>.from(coursesList.map((item) => Course.fromJson(item)));

          return courseList;
        } else {
          print("Null response or data in response");
          return [];
        }
      } else {
        print("Server error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception during displayMyJobs request: $e");
      return [];
    }
  }

}