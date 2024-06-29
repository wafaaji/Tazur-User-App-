import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/model/updatePersonalInformationModel.dart';
import 'package:graduation_project/modules/personal-information-profile/personalInformationService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class PersonalInformationController extends BaseController {
  late TextEditingController firstNameController, lastNameController, addressController, phoneController;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var address = ''.obs;
  var phone = ''.obs;
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // Image
  var isProfilePicPathSet = false.obs;
  var profilePicPath = ''.obs;

  // Governorate
  final selectGovernorate = ''.obs;

  // FamilyState
  final selectFamilyState = ''.obs;

  // Nationality
  final selectNationality = ''.obs;

  // for update personal information api
  late PersonalInformationService service;
  var updatePersonalInformationStatus = false;
  var message;

  @override
  void onInit() {
    service = PersonalInformationService();

    firstNameController = TextEditingController(text: firstName.value);
    lastNameController = TextEditingController(text: lastName.value);
    addressController = TextEditingController(text: address.value);
    phoneController = TextEditingController(text: phone.value);

    fetchPersonalInformation(); // Fetch user's existing information

    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void fetchPersonalInformation() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var personalInfo = await service.fetchPersonalInformation(token!);

    if (personalInfo != null) {
      firstName.value = personalInfo['first_name'];
      lastName.value = personalInfo['last_name'];
      address.value = personalInfo['address'];
      phone.value = personalInfo['phone'];
      profilePicPath.value = personalInfo['image'] ?? '';
      selectGovernorate.value = translateValue(personalInfo['governorate']);
      selectFamilyState.value = translateValue(personalInfo['marital_status']);
      selectNationality.value = translateValue(personalInfo['nationality']);

      firstNameController.text = firstName.value;
      lastNameController.text = lastName.value;
      addressController.text = address.value;
      phoneController.text = phone.value;
    }
    isLoading.value = false;
    print('Image:' + profilePicPath.value);
    print('First Name:' + firstName.value);
    print('Last Name:' + lastName.value);
    print('Address:' + address.value);
    print('Phone:' + phone.value);
    print('Governorate:' + selectGovernorate.value);
    print('Family State:' + selectFamilyState.value);
    print('Nationality:' + selectNationality.value);
  }

  void setSelectedGovernorate(String value) {
    selectGovernorate.value = value;
  }

  void setSelectedFamilyState(String value) {
    selectFamilyState.value = value;
  }

  void setSelectedNationality(String value) {
    selectNationality.value = value;
  }

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;
  }

  // Update Personal Information API
  Future<void> updatePersonalInformation() async {
    // Update other fields
    firstName.value = firstNameController.text;
    lastName.value = lastNameController.text;
    address.value = addressController.text;
    phone.value = phoneController.text;

    try {
      var token = await storage.read("token");

      String? imageToUpload;
      if (profilePicPath.value.isNotEmpty &&
          !profilePicPath.value.startsWith('http')) { // Check if it's not a URL
        imageToUpload = profilePicPath.value;
      }

      UpdatePersonalInformationModel updatePersonalInformation = UpdatePersonalInformationModel(
        image: imageToUpload,
        firstName: firstName.value,
        lastName: lastName.value,
        governorate: selectGovernorate.value,
        address: address.value,
        phone: phone.value,
        maritalStatus: selectFamilyState.value,
        nationality: selectNationality.value,
      );

      updatePersonalInformationStatus =
      await service.UpdatePersonalInformation(
          token!, updatePersonalInformation);
      message = service.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error updating personal information: $e");
      message = 'Error updating personal information: $e'.tr;
    }
  }



  String translateValue(String value) {
    final Map<String, String> arabicToEnglish = {
      'دمشق': 'Damascus', 'ريف دمشق': 'Rif Damascus', 'حمص': 'Homs', 'حلب': 'Aleppo', 'طرطوس': 'Tartus', 'اللاذقية': 'Latakia', 'حماه': 'Hama', 'السويداء': 'Al-Suwayda', 'درعا': 'Daraa', 'دير الزور': 'Deir El-Zor', 'الحسكة': 'Al-Hasakah', 'إدلب': 'Idlib', 'الرقة': 'Al-Raqqah', 'القنيطرة': 'Quneitra',
      'أعزب' : 'Single', 'متزوج' : 'Married', 'مخطوب' : 'Engaged', 'أرمل' : 'Widower', 'مطلق' : 'Absolute',
      'سوري' : 'Syrian', 'فلسطيني' : 'Palestinian', 'عراقي' : 'Iraqian', 'اخرى' : 'Other',
    };

    final Map<String, String> englishToArabic = {
      'Damascus': 'دمشق', 'Rif Damascus': 'ريف دمشق', 'Homs': 'حمص', 'Aleppo': 'حلب', 'Tartus': 'طرطوس', 'Latakia': 'اللاذقية', 'Hama': 'حماه', 'Al-Suwayda': 'السويداء', 'Daraa': 'درعا', 'Deir El-Zor': 'دير الزور', 'Al-Hasakah': 'الحسكة', 'Idlib': 'إدلب', 'Al-Raqqah': 'الرقة', 'Quneitra': 'القنيطرة',
      'Single' : 'أعزب', 'Married' : 'متزوج', 'Engaged' : 'مخطوب', 'Widower' : 'أرمل', 'Absolute' : 'مطلق',
      'Syrian' : 'سوري', 'Palestinian' : 'فلسطيني', 'Iraqian' : 'عراقي', 'Other' : 'اخرى',
    };

    if (Get.locale?.languageCode == 'ar') {
      return englishToArabic[value] ?? value;
    } else {
      return arabicToEnglish[value] ?? value;
    }
  }
}
