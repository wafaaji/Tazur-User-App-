import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final double? size;

  CustomIconButton({
    required this.onPressed,
    required this.icon,
    this.color = primaryBlackColor,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: size, color: color),
    );
  }
}
