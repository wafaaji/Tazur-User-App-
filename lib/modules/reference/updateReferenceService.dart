import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/updateReferenceModel.dart';
import 'package:http/http.dart' as http;

class UpdateReferenceService {
  var message;

  Future<bool> UpdateReference(var token, UpdateReferenceModel updateReference, int referenceId) async {

    print('Reference Name: ${updateReference.reference!.name}');
    print('Employment: ${updateReference.reference!.employment}');
    print('Email: ${updateReference.reference!.email}');
    print('Phone: ${updateReference.reference!.phone}');

    var response = await http.post(
      Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
          .updateReference}/$referenceId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "name": updateReference.reference!.name,
        "employment": updateReference.reference!.employment,
        'email': updateReference.reference!.email,
        'phone': updateReference.reference!.phone,
      },
      ),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      // Parse JSON
      var jsonResponse = jsonDecode(response.body);
      // Handle response
      message = 'update reference successfully'.tr;
      print(
          '-----------------------------------------------------------------');
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchReference(var token, int referenceId) async {
    try {
      var response = await http.post(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
            .updateReference}/$referenceId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print('Failed to fetch and update reference: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching and updating reference: $e');
      return null;
    }
  }

}