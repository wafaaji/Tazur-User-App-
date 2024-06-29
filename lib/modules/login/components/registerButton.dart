import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/constants.dart';

class RegisterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        duration: Duration(milliseconds: 2500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "do not have an account".tr,
              color: primaryBlackColor.withOpacity(0.50),
            ),
            CustomTextButton(
              onPressed: (){
                Get.toNamed('/register');
              },
              text: "register".tr,
              color: primaryBlackColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ],
        ));
  }
}
