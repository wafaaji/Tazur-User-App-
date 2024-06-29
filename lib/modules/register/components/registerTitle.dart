import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class RegisterTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
          duration: Duration(milliseconds: 1500),
          child: CustomText(
            text: 'register'.tr,
            color: primaryBlackColor,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        FadeInUp(
          duration: Duration(milliseconds: 1700),
          child: CustomText(
            text: 'create account'.tr,
            color: primaryBlackColor.withOpacity(0.50),
          ),
        ),
      ],
    );
  }
}
