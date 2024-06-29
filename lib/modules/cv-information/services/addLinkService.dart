import 'dart:convert';
import 'package:get/get.dart';
import 'package:graduation_project/config/serverConfig.dart';
import 'package:graduation_project/model/addLinkModel.dart';
import 'package:http/http.dart' as http;

class AddLinkService {

  var message;

  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.addLink);

  Future<bool> addLink(var token, AddLinkModel addLink) async {
    print("Link Title: ${addLink.link!.title}");
    print("Link: ${addLink.link!.link}");

    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "title": addLink.link!.title,
        "link": addLink.link!.link,
      }),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = 'add link successfully'.tr;
      return true;
    } else {
      message = 'server error'.tr;
      return false;
    }
  }

}