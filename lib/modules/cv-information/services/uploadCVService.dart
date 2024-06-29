import 'dart:convert';
import 'dart:io';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/uploadCVModel.dart';
import 'package:http/http.dart' as http;

Future<void> uploadFile(File file, String token) async {
  // Create a multipart request
  var request = http.MultipartRequest(
    'POST',
      Uri.parse(
          ServerConfig.domainNameServer + ServerConfig.uploadCV),
  );

  // Attach the file to the request
  request.files.add(
    await http.MultipartFile.fromPath('file', file.path),
  );

  // Set the authorization header
  request.headers['Authorization'] = 'Bearer $token';

  // Send the request
  var response = await request.send();

  // Check the response status
  if (response.statusCode == 200) {
    // Parse the response JSON using the UploadResponse model
    var jsonResponse = await response.stream.bytesToString();
    var uploadResponse = UploadCVModel.fromJson(json.decode(jsonResponse));

    // Handle the upload response
    print('Message: ${uploadResponse.message}');
    print('CV File: ${uploadResponse.cvFile}');
  } else {
    print('Failed to upload file: ${response.reasonPhrase}');
  }
}
