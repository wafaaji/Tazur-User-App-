import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/referenceModel.dart';
import 'package:graduation_project/model/updateReferenceModel.dart';
import 'package:graduation_project/modules/reference/updateReferenceService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class UpdateReferenceController extends GetxController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;
  var referenceId = Get.arguments['referenceId'];
  var message;

  // Update Reference
  late TextEditingController referenceNameController, employmentController, referenceEmailController, referencePhoneController;
  var referenceName = ''.obs;
  var employment = ''.obs;
  var referenceEmail = ''.obs;
  var referencePhone = ''.obs;
  late UpdateReferenceService updateReferenceService;
  var updateReferenceStatus = false;

  @override
  void onInit() {
    updateReferenceService = UpdateReferenceService();
    referenceNameController = TextEditingController(text: referenceName.value);
    employmentController = TextEditingController(text: employment.value);
    referenceEmailController = TextEditingController(text: referenceEmail.value);
    referencePhoneController = TextEditingController(text: referencePhone.value);

    fetchReference();
    print(referenceId);
    super.onInit();
  }

  void fetchReference() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var referenceInfo = await updateReferenceService.fetchReference(token, referenceId);

    if (referenceInfo != null) {
      var referenceData = referenceInfo['reference'];
      referenceName.value = referenceData['name'] ?? 'reference name'.tr;
      employment.value = referenceData['employment'] ?? 'employment'.tr;
      referenceEmail.value = referenceData['email'] ?? 'reference email'.tr;
      referencePhone.value = referenceData['phone'] ?? 'reference phone'.tr;


      referenceNameController.text = referenceName.value;
      employmentController.text = employment.value;
      referenceEmailController.text = referenceEmail.value;
      referencePhoneController.text = referencePhone.value;

      isLoading.value = false;
      print('Reference Name:' + referenceName.value);
      print('Employment:' + employment.value);
      print('Reference Email:' + referenceEmail.value);
      print('Reference Phone:' + referencePhone.value);
    }
  }

  // Update Reference API
  Future<void> UpdateReference() async {
    referenceName.value = referenceNameController.text;
    employment.value = employmentController.text;
    referenceEmail.value = referenceEmailController.text;
    referencePhone.value = referencePhoneController.text;
    try {
      var token = await storage.read("token");
      UpdateReferenceModel updateReference = UpdateReferenceModel(
        reference: Reference(
          name: referenceName.value,
          employment: employment.value,
          email: referenceEmail.value,
          phone: referencePhone.value,
        ),
      );

      updateReferenceStatus = await updateReferenceService.UpdateReference(token, updateReference, referenceId);
      message = updateReferenceService.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error updating reference: $e");
      message = 'error updating reference: $e'.tr;
    }
  }

}