import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onPressed;
  final bool isArabic;

  CustomAppBar({this.title, this.onPressed, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0,
        backgroundColor: primaryWhiteColor,
        leading: IconButton(
          onPressed: onPressed,
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
        title: CustomText(
          text: title!,
            color: primaryBlackColor,
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
