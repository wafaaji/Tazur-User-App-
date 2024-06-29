import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/jobModel.dart';
import 'package:graduation_project/model/searchJobModel.dart';
import 'package:http/http.dart' as http;

class SearchJobsService {

  Future<List<Job>> displaySearchJobs(var token, SearchJobModel searchJob, int page) async{

    print('Value: ${searchJob.value}');
    try {
      var response = await http.post(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.searchJob + '?page=$page'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'value' : searchJob.value,
        }
        ),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        //take json and make it var
        var jsonResponse = jsonDecode(response.body);
        var jobsSearchList = jsonResponse["data"];
        print("-----------------display search Jobs----------------");
        print(jobsSearchList);

        List<Job> jobSearchList = List<Job>.from(jobsSearchList.map((item) => Job.fromJson(item)));

        return jobSearchList;
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