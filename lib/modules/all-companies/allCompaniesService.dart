import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:http/http.dart' as http;

class AllCompaniesService {

  Future<List<Companies>> displayAllCompanies(var token, int page) async{
    try {
      var response = await http.get(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.allCompanies + '?page=$page'),
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
          var allCompaniesList = jsonResponse["data"];
          print("-----------------display all Companies----------------");
          print(allCompaniesList);

          List<Companies> allCompanyList = List<Companies>.from(allCompaniesList.map((item) => Companies.fromJson(item)));

          return allCompanyList;
        } else {
          print("Null response or data in response");
          return [];
        }
      } else {
        print("Server error: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception during displayAllCompanies request: $e");
      return [];
    }
  }

}