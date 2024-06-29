import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/updateLinksModel.dart';
import 'package:http/http.dart' as http;

class UpdateLinkService {
  var message;

  Future<bool> UpdateLink(var token, UpdateLinkModel updateLink, int linkId) async {

    print('Link Title: ${updateLink.link!.title}');
    print('Link: ${updateLink.link!.link}');

    var response = await http.post(
      Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
          .updateLink}/$linkId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "title": updateLink.link!.title,
        "link": updateLink.link!.link,
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
      message = 'update link successfully'.tr;
      print(
          '-----------------------------------------------------------------');
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchLink(var token, int linkId) async {
    try {
      var response = await http.post(
        Uri.parse('${ServerConfig.domainNameServer}${ServerConfig
            .updateLink}/$linkId'),
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
        print('Failed to fetch and update link: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching and updating link: $e');
      return null;
    }
  }

}