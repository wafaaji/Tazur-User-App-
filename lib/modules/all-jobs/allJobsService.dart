import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/jobModel.dart';
import 'package:http/http.dart' as http;

class AllJobsService {

  Future<List<Job>> displayAllJobs(var token, int page) async{
    try {
      var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.allJobs + '?page=$page'),
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
          var allJobsList = jsonResponse["data"];
        print("-----------------display all Jobs----------------");
        print(allJobsList);

          List<Job> allJobList = List<Job>.from(allJobsList.map((item) => Job.fromJson(item)));

        return allJobList;
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