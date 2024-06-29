import 'package:flutter/material.dart';
import 'package:graduation_project/components/customText.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;

  CustomTextButton({
    required this.onPressed,
    required this.text,
    required this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {

    return  TextButton(
      onPressed:  onPressed,
      child: CustomText(
        text: text,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
