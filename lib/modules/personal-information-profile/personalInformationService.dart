import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/updatePersonalInformationModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class PersonalInformationService {
  var message;

  var url = Uri.parse(
      ServerConfig.domainNameServer + ServerConfig.updatePersonalInformation);

  Future<bool> UpdatePersonalInformation(String token, UpdatePersonalInformationModel updatePersonalInformation) async {
    try {
      var request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token'
        ..headers['Accept'] = 'application/json';

      if (updatePersonalInformation.image != null) {
        var imageFile = File(updatePersonalInformation.image!);
        var stream = http.ByteStream(imageFile.openRead());
        var length = await imageFile.length();
        var mimeType = lookupMimeType(imageFile.path);

        request.files.add(http.MultipartFile(
          'image',
          stream,
          length,
          filename: imageFile.path.split('/').last,
          contentType: MediaType.parse(mimeType!),
        ));
      }

      request.fields['first_name'] = updatePersonalInformation.firstName!;
      request.fields['last_name'] = updatePersonalInformation.lastName!;
      request.fields['governorate'] = updatePersonalInformation.governorate!;
      request.fields['address'] = updatePersonalInformation.address!;
      request.fields['marital_status'] = updatePersonalInformation.maritalStatus!;
      request.fields['nationality'] = updatePersonalInformation.nationality!;
      request.fields['phone'] = updatePersonalInformation.phone!;

      var response = await request.send();

      var responseBody = await response.stream.bytesToString();

      print('Response status: ${response.statusCode}');
      print('Response body: $responseBody');

      if (response.statusCode == 200) {
        // Handle success
        message = 'update personal information successfully'.tr;
        return true;
      } else {
        // Handle error
        message = 'server error'.tr;
        return false;
      }
    } catch (e) {
      print("Error updating personal information: $e");
      message = 'Error updating personal information: $e'.tr;
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchPersonalInformation(String token) async {
    try {
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print('Failed to fetch and update personal information: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching and updating personal information: $e');
      return null;
    }
  }
}
