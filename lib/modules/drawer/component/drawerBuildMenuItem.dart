import 'package:flutter/material.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class DrawerBuildMenuItem extends StatelessWidget {
  final String text;
  final String urlImg;
  VoidCallback? onClicked;

  DrawerBuildMenuItem({
    required this.urlImg,
    required this.text,
    this.onClicked,
});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomAssetImage(imagePath:urlImg, color: primaryWhiteColor, height: 30,),
      title: CustomText(text: text,color: primaryWhiteColor, fontSize: 18,textAlign: TextAlign.start,),
      hoverColor: secondaryWhiteColor,
      onTap: onClicked != null ? () => onClicked!() : null,
    );
  }
}
