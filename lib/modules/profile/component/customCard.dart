import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class CustomCard extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap; // Change Function to VoidCallback

  const CustomCard({
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
        color: secondaryWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(
            leadingIcon,
            color: primaryBlackColor,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_outlined,
            color: primaryBlackColor,
          ),
        ),
      ),
    );
  }
}
