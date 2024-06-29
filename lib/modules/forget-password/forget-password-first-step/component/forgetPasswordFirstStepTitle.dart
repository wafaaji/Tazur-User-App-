import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class ForgetPasswordFirstStepTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomAssetImage(
          imagePath: 'assets/images/forget password.png',
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        CustomText(
          text: 'forget password'.tr,
          color: primaryBlackColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: 'enter email'.tr,
          color: primaryBlackColor.withOpacity(0.50),
        ),
      ],
    );
  }
}
