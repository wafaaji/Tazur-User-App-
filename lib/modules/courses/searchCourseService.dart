import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/courseModel.dart';
import 'package:graduation_project/model/searchCourseModel.dart';
import 'package:http/http.dart' as http;

class SearchCourseService {

  Future<List<Course>> displaySearchCourse(var token, SearchCourseModel searchCourse, int page) async{

    print('Value: ${searchCourse.value}');
    try {
      var response = await http.post(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.searchCourse + '?page=$page'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'value' : searchCourse.value,
          }
        ),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        //take json and make it var
        var jsonResponse = jsonDecode(response.body);
        var coursesSearchList = jsonResponse["data"];
        print("-----------------display search Courses----------------");
        print(coursesSearchList);

        List<Course> courseSearchList = List<Course>.from(coursesSearchList.map((item) => Course.fromJson(item)));

        return courseSearchList;
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