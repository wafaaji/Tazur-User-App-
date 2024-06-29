import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class PINTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomAssetImage(
          imagePath: 'assets/images/PIN code.png',
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        CustomText(
          text: 'verification code'.tr,
          color: primaryBlackColor,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: 'enter pin'.tr,
          color: primaryBlackColor.withOpacity(0.50),
        ),
      ],
    );
  }
}
