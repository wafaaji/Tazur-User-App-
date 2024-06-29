import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/updateLinksModel.dart';
import 'package:graduation_project/model/userLinkModel.dart';
import 'package:graduation_project/modules/link/updateLinkService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class UpdateLinkController extends GetxController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;
  var linkId = Get.arguments['linkId'];
  var message;

  // Update Link
  late TextEditingController linkTitleController, linkController;
  var linkTitle = ''.obs;
  var link = ''.obs;
  late UpdateLinkService updateLinkService;
  var updateLinkStatus = false;

  @override
  void onInit() {
    updateLinkService = UpdateLinkService();
    linkTitleController = TextEditingController(text: linkTitle.value);
    linkController = TextEditingController(text: link.value);

    fetchLink();
    print(linkId);
    super.onInit();
  }

  void fetchLink() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var linkInfo = await updateLinkService.fetchLink(token, linkId);

    if (linkInfo != null) {
      var linkData = linkInfo['link'];
      linkTitle.value = linkData['title'] ?? 'link title'.tr;
      link.value = linkData['link'] ?? 'link'.tr;

      linkTitleController.text = linkTitle.value;
      linkController.text = link.value;

      isLoading.value = false;
      print('Link Title:' + linkTitle.value);
      print('Link:' + link.value);
    }
  }

  // Update Link API
  Future<void> UpdateLink() async {
    linkTitle.value = linkTitleController.text;
    link.value = linkController.text;
    try {
      var token = await storage.read("token");
      UpdateLinkModel updateLink = UpdateLinkModel(
        link: Link(
          title: linkTitle.value,
          link: link.value,
        ),
      );

      updateLinkStatus = await updateLinkService.UpdateLink(token, updateLink, linkId);
      message = updateLinkService.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error updating link: $e");
      message = 'error updating link: $e'.tr;
    }
  }

}