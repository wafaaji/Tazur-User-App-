import 'package:flutter/material.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class SettingsContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;

  const SettingsContainer({
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed, // Use InkWell to make the whole container clickable
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          color: secondaryWhiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CustomAssetImage(
                imagePath: imagePath,
                height: 30.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              CustomText(
                text: text,
                  color: primaryBlackColor,
                  fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
