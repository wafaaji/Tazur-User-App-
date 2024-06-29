import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/addExperienceModel.dart';
import 'package:graduation_project/model/addReferenceModel.dart';
import 'package:http/http.dart' as http;

class AddReferenceService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.addReference);

  Future<bool> addReference(var token, AddReferenceModel addReference) async {
    print("Reference Name: ${addReference.reference!.name}");
    print("Employment: ${addReference.reference!.employment}");
    print("Email: ${addReference.reference!.email}");
    print("Phone: ${addReference.reference!.phone}");

    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "name": addReference.reference!.name,
        "employment": addReference.reference!.employment,
        "email": addReference.reference!.email,
        "phone": addReference.reference!.phone,
      }),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = 'add reference successfully'.tr;
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

}