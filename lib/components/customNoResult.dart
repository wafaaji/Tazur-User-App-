import 'package:flutter/material.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customElevatedButton.dart';

class CustomNoResult extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  CustomNoResult({
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomAssetImage(
            imagePath: 'assets/images/no data.png',
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          CustomText(
            text: text,
            color: primaryBlackColor,
            fontSize: 25.0,
          ),
          SizedBox(height: 20.0),
          if (onPressed != null) // Display the button only if onPressed function is provided
            CustomElevatedButton(
              onPressed: onPressed!,
              text: 'try again button'.tr,
            ),
        ],
      ),
    );
  }
}
