import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/jobModel.dart';
import 'package:http/http.dart' as http;

class MyJobsService {

  Future<List<Job>> displayMyJobs(var token, int page) async {
    try {
      var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.myJobs + '?page=$page'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // Parse response body safely
        var jsonResponse = json.decode(response.body);
        if (jsonResponse != null && jsonResponse["data"] != null) {
          var myJobsList = jsonResponse["data"];
          print("-----------------display my Jobs----------------");
          print(myJobsList);

          List<Job> myJobList = List<Job>.from(myJobsList.map((item) => Job.fromJson(item)));

          return myJobList;
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