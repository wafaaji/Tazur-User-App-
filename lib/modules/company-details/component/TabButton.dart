import 'package:flutter/material.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class TabButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const TabButton(
      {Key? key,
        required this.text,
        required this.onPressed,
        this.isSelected = false
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? primaryWhiteColor : primaryBlackColor, backgroundColor: isSelected ? primaryGreenColor : secondaryWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: CustomText(
          text:text,
          color: isSelected ? primaryWhiteColor : primaryBlackColor,
        ),
      ),
    );
  }
}