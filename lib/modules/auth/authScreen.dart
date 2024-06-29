import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/auth/authController.dart';
import 'package:graduation_project/modules/auth/components/customToggleButtons.dart';
import 'package:animate_do/animate_do.dart';

class AuthScreen extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInUp(
                  duration: Duration(milliseconds: 1500),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: primaryGreenColor
                        ),
                        child: CustomAssetImage(
                          imagePath: 'assets/images/auth.png',
                        ),
                      ),
                    ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeInUp(
                  duration: Duration(milliseconds: 1700),
                    child: Column(
                      children: [
                        CustomText(
                          text: 'title'.tr,
                          color: primaryBlackColor,
                          fontSize: 30,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        CustomText(
                          text: 'description'.tr,
                          color: primaryBlackColor.withOpacity(0.50),
                          fontSize: 16,
                        ),
                      ],
                    ),
                ),
              ],
            ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 30,
                  child: FadeInUp(
                    duration: Duration(milliseconds: 2000),
                    child: Center(
                      child: CustomToggleButtons(
                        labels: ['register'.tr, 'login'.tr],
                        authController: controller,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
