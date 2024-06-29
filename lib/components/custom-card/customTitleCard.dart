import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomTitleCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final DateTime createdAt;

  CustomTitleCard({
    required this.imgPath,
    required this.title,
    required this.createdAt,
});

  String getFormattedCreationTime() {
    // Calculate the difference between the current time and the creation time of the job
    Duration difference = DateTime.now().difference(createdAt);

    // Format the difference into a human-readable string
    if (difference.inDays > 0) {
      return '${difference.inDays} '+'days ago'.tr;
    } else if (difference.inHours > 0) {
      return '${difference.inHours} '+'hours ago'.tr;
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} '+'minutes ago'.tr;
    } else {
      return 'just now'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = getFormattedCreationTime();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor:  primaryGreenColor,
          backgroundImage: NetworkImage(imgPath),
          radius: 30,
        ),
        SizedBox(width: 10),
        Flexible(
          child: CustomText(
            text: title,
            color: primaryBlackColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 5),
        CustomText(
          text: formattedTime,
          color: primaryBlackColor.withOpacity(0.50),
          fontSize: 10,
        ),
      ],
    );
  }
}
