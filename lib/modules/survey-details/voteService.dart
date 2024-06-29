import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/voteModel.dart';

class VoteService {
  var message;

  Future<VoteModel> Vote(String token, int surveyId, VoteModel vote) async {
    try {
      var response = await http.post(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig.surveyVote}/$surveyId'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        },
        body: voteModelToJson(vote),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // Parse response body safely
        final jsonResponse = jsonDecode(response.body);
        return VoteModel.fromJson(jsonResponse);
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to cast vote');
      }
    } catch (e) {
      // Catch any exceptions thrown during the process
      print('Exception during request: $e');
      rethrow; // Rethrow the exception to be caught by the caller
    }
  }
}
