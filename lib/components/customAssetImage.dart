import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  final String imagePath;
  final double? height;
  final Color? color;

  CustomAssetImage({
    required this.imagePath,
    this.height,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: height,
      fit: BoxFit.cover,
      color: color,
    );
  }
}
