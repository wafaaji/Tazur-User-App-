import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/companyDetailsModel.dart';

class CompanyDetailsService {
  Future<CompanyDetailsModel> displayCompanyDetails(String token, int companyId) async {
    try {
      var response = await http.get(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig.companyDetails}/$companyId'),
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json',
        },
      );

      print('[Response] Status Code: ${response.statusCode}');
      print('[Response] Body: ${response.body}'); // Print response body here

      if (response.statusCode == 200) {
        // Check if the response body is not null and not empty
        if (response.body != null && response.body.isNotEmpty) {
          // Parse response body
          final jsonResponse = jsonDecode(response.body);
          print('[Parsed JSON] $jsonResponse');
          return CompanyDetailsModel.fromJson(jsonResponse);
        } else {
          throw Exception('Response body is null or empty');
        }
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to load company details. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Catch any exceptions thrown during the process
      print('Exception during request: $e');
      rethrow; // Rethrow the exception to be caught by the caller
    }
  }

}