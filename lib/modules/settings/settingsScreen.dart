import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/language/localController.dart';
import 'package:graduation_project/modules/settings/component/settingsContainer.dart';
import 'package:graduation_project/modules/settings/settingsController.dart';

class SettingsScreen extends GetView<SettingsController> {
  LocaleController controllerLang = Get.find();

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'settings'.tr,
        onPressed: () {
          Get.back();
        },
        isArabic: isArabic,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SettingsContainer(
                imagePath: 'assets/icons/settings-icons/language.png',
                text: 'change language'.tr,
                onPressed: (){
                  controllerLang.changeLang();
                },
                ),
            SizedBox(
              height: 20.0,
            ),
            SettingsContainer(
                imagePath: 'assets/icons/settings-icons/delete account.png',
                text: 'delete account'.tr,
              onPressed: (){},
            ),
            SizedBox(
              height: 20.0,
            ),
            SettingsContainer(
              imagePath: 'assets/icons/settings-icons/password.png',
              text: 'change password'.tr,
              onPressed: (){},
            ),
            SizedBox(
              height: 20.0,
            ),
            SettingsContainer(
              imagePath: 'assets/icons/settings-icons/logout.png',
              text: 'logout'.tr,
              onPressed: (){
                onClickLogout();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Logout
  void onClickLogout() async{
    CustomEasyLoading.showLoading();

    await controller.logoutOnClick();
    CustomEasyLoading.dismiss();

    if(controller.logoutStatus){
      CustomEasyLoading.showSuccess(controller.message);
      Get.offAllNamed("/splash");
    }else{
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

  // Change language
  void changeLanguage() {
    controllerLang.changeLang();

    // Reload the app after changing the language
    Get.offAllNamed("/splash")!.then((_) {
      Get.reset(); // Reset all controllers and services
      Get.find(); // Reinitialize all controllers and services
    });
  }

}
