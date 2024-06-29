import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:http/http.dart' as http;

class FollowCompaniesService {

  Future<List<Companies>> displayFollowCompanies(var token, int page) async {
    try {
      var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.followCompanies + '?page=$page'),
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
          var followCompaniesList = jsonResponse["data"];
          print("-----------------display Follow Companies----------------");
          print(followCompaniesList);

          List<Companies> followCompanyList = List<Companies>.from(followCompaniesList.map((item) => Companies.fromJson(item)));

          return followCompanyList;
        } else {
          print("Null response or data in response");
          return [];
        }
      } else {
        print("Server error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception during displayFollowCompanies request: $e");
      return [];
    }
  }

}