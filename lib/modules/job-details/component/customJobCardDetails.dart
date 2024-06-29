import 'package:flutter/material.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomJobCardDetails extends StatelessWidget {
  final String imgPath;
  final String title;
  final String text;

  CustomJobCardDetails({
    required this.imgPath,
    required this.title,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryWhiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.07,
            child: CustomAssetImage(
              imagePath: imgPath,
              height: 26,
              color: primaryGreenColor,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: CustomText(
              text: title,
              color: primaryBlackColor,
              textAlign: TextAlign.start,
              fontSize: 13,
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.46,
            child: CustomText(
              text: text,
              color: primaryBlackColor,
              textAlign: TextAlign.start,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
