import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/getConsultationModel.dart';
import 'package:http/http.dart' as http;

class GetConsultationService {
  Future<List<UserConsultation>> displayUserConsultation(var token, GetConsultationModel getConsultation) async {
    print("Consultation Topic: ${getConsultation.topic}");
    var url = Uri.parse(
        ServerConfig.domainNameServer + ServerConfig.getConsultations);
    try {
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'topic' : getConsultation.topic,
        }),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse != null && jsonResponse["user_consultation"] != null) {
          var consultationsList = jsonResponse["user_consultation"];
          print("-----------------display Consultations----------------");
          print(consultationsList);

          List<UserConsultation> consultationList = List<UserConsultation>.from(
              consultationsList.map((item) => UserConsultation.fromJson(item)));

          return consultationList;
        }
      } else {
        print("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception during request: $e");
    }
    // If any error occurred, or if the response was not successful, return an empty list wrapped in a Future.
    return Future.value([]);
  }

}