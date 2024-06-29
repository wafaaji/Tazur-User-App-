import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/CourseModel.dart';
import 'package:graduation_project/model/filterCourseModel.dart';
import 'package:graduation_project/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class FilterCoursesService {

  Future<List<Course>> displayFilterCourses(var token, FilterCourseModel filterCourse , int page) async{
    SecureStorage storage = SecureStorage();
    var token = await storage.read("token");

    print('Topic: ${filterCourse.topic}');
    print('Work City: ${filterCourse.work_city}');
    try {
      var response = await http.post(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.filterCourse + '?page=$page'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'topic' : filterCourse.topic,
          'work_city' : filterCourse.work_city,
        }
        ),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        //take json and make it var
        //  var allCourses = allCoursesModelFromJson(response.body);
        var jsonResponse = jsonDecode(response.body);
        var CoursesFilterList = jsonResponse["data"];
        print("-----------------display filter Courses----------------");
        print(CoursesFilterList);

        List<Course> CourseFilterList = List<Course>.from(CoursesFilterList.map((item) => Course.fromJson(item)));
        print('courses length: ${CourseFilterList.length}');
        return CourseFilterList;
      } else {
        print("Server Error: ${response.statusCode}");
        return []; // Return empty list if server responds with an error
      }
    } catch (e) {
      print("Exception during request: $e");
      return []; // Return empty list if an exception occurs
    }

  }


}