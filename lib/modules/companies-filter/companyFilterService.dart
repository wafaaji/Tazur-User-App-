import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:graduation_project/model/filterCompanyModel.dart';
import 'package:graduation_project/native-services/secureStorage.dart';
import 'package:http/http.dart' as http;

class FilterCompanyService {

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.filterCompanies);

  Future<List<Companies>> displayFilterCompanies(var token, FilterCompanyModel filterCompany , int page) async{
    SecureStorage storage = SecureStorage();
    var token = await storage.read("token");

    print('Topic: ${filterCompany.topic}');
    print('Work City: ${filterCompany.work_city}');
    try {
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'topic' : filterCompany.topic,
          'work_city' : filterCompany.work_city,
        }
        ),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var CompaniesFilterList = jsonResponse["data"];
        print("-----------------display filter Companies----------------");
        print(CompaniesFilterList);

        List<Companies> CompanyFilterList = List<Companies>.from(CompaniesFilterList.map((item) => Companies.fromJson(item)));

        return CompanyFilterList;
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