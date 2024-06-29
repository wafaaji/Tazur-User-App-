import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class ApplyConsultationDefinitionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryWhiteColor,
        leading: IconButton(
          onPressed: (){
            Get.offAllNamed('/home');
          },
          icon: isArabic
              ? Transform.rotate(
            angle: pi,
            child: CustomAssetImage(
              imagePath: 'assets/icons/back button.png',
              height: 30.0,
            ),
          )
              : CustomAssetImage(
            imagePath: 'assets/icons/back button.png',
            height: 30.0,
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                CustomAssetImage(
                    imagePath:  'assets/images/onboarding-image/onboarding4.png',
                    height: MediaQuery.of(context).size.height * 0.4,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: 'connect with advisor'.tr,
                  color: primaryBlackColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  padding: EdgeInsets.only(left: 25.0, right:25.0),
                  child: CustomText(
                    text:'connect with advisor definition'.tr,
                    color: primaryBlackColor.withOpacity(0.50),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 30,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomElevatedButton(
                  onPressed: () {
                    Get.offNamed('/applyConsultation');
                  },
                  text: 'start button'.tr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
