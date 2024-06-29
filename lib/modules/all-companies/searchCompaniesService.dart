import 'dart:convert';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:graduation_project/model/searchCompanyModel.dart';
import 'package:http/http.dart' as http;

class SearchCompaniesService {

  Future<List<Companies>> displaySearchCompanies(var token, SearchCompanyModel searchCompanies, int page) async{

    print('Value: ${searchCompanies.value}');
    try {
      var response = await http.post(
        Uri.parse(ServerConfig.domainNameServer + ServerConfig.searchCompanies + '?page=$page'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer ${token}",
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'value' : searchCompanies.value,
        }
        ),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        //take json and make it var
        var jsonResponse = jsonDecode(response.body);
        var companiesSearchList = jsonResponse["data"];
        print("-----------------display search Companies----------------");
        print(companiesSearchList);

        List<Companies> CompanySearchList = List<Companies>.from(companiesSearchList.map((item) => Companies.fromJson(item)));

        return CompanySearchList;
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