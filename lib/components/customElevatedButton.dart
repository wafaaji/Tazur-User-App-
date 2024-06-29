import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color overlayColor;
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;
  final Color borderColor;
  final double borderWidth;
  final double width;

  const CustomElevatedButton({
    required this.onPressed,
    this.backgroundColor = primaryGreenColor,
    this.overlayColor  = secondaryGreenColor,
    required this.text,
    this.textColor = primaryWhiteColor,
    this.textSize = 16,
    this.textWeight = FontWeight.bold,
    this.borderColor = Colors.transparent,
    this.borderWidth = 2,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        elevation: MaterialStateProperty.all<double>(4),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(Size(width, 45)),
        overlayColor: MaterialStateProperty.all<Color>(overlayColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: textWeight,
        ),
      ),
    );
  }
}
