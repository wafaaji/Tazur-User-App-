import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String imagePath;
  final double radius;
  final Color color;

  const CustomCircleAvatar({
    required this.imagePath,
    required this.radius,
    this.color = primaryWhiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: CircleAvatar(
        backgroundColor:  color,
        backgroundImage: NetworkImage(imagePath),
        radius: radius,
      ),
    );
  }
}
