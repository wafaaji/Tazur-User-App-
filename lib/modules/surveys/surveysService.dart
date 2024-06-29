import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/surveyModel.dart';
import 'package:http/http.dart' as http;

class SurveysService {

  Future<List<Survey>> displaySurveys(var token, int page) async {
    try {
      var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.showSurveys + '?page=$page'),
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
          var surveysList = jsonResponse["data"];
          print("-----------------display Surveys----------------");
          print(surveysList);

          List<Survey> surveyList = List<Survey>.from(surveysList.map((item) => Survey.fromJson(item)));

          return surveyList;
        } else {
          print("Null response or data in response");
          return [];
        }
      } else {
        print("Server error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception during displaySurveys request: $e");
      return [];
    }
  }

}