import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/jobModel.dart';
import 'package:graduation_project/model/filterJobModel.dart';
import 'package:graduation_project/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class FilterJobsService {

  Future<List<Job>> displayFilterJobs(var token, FilterJobModel filterJob , int page) async{
    SecureStorage storage = SecureStorage();
    var token = await storage.read("token");

    print('Topic: ${filterJob.topic}');
    print('Experience Years: ${filterJob.experience_years}');
    print('Work City: ${filterJob.work_city}');
    try {
      var response = await http.post(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.filterJob + '?page=$page'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'topic' : filterJob.topic,
          'experience_years' : filterJob.experience_years,
          'work_city' : filterJob.work_city,
        }
        ),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        //take json and make it var
        //  var allJobs = allJobsModelFromJson(response.body);
        var jsonResponse = jsonDecode(response.body);
        var jobsFilterList = jsonResponse["data"];
        print("-----------------display filter Jobs----------------");
        print(jobsFilterList);

        List<Job> jobFilterList = List<Job>.from(jobsFilterList.map((item) => Job.fromJson(item)));
        print('job lenght: ${jobFilterList.length}');
        return jobFilterList;
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