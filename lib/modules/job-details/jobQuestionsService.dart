import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/questionModel.dart';

class JobQuestionsService {
  var message;

  Future<List<QuestionModel>> displayJobQuestions(var token, int jobId) async {
    try {
      var response = await http.get(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig.jobQuestions}/$jobId'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        },
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse != null && jsonResponse is List && jsonResponse.length > 0) {
          var questionsList = jsonResponse;
          print("----------------- Display Job Questions ----------------");
          print(questionsList);

          List<QuestionModel> questionList = List<QuestionModel>.from(questionsList.map((item) => QuestionModel.fromJson(item)));
          return questionList;
        } else {
          print("No questions found in response");
          return [];
        }
      } else {
        print("Server error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception during displayJobQuestions request: $e");
      return [];
    }
  }
}

