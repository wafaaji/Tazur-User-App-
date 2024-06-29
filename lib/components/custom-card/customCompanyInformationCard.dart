import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomCompanyInformationCard extends StatelessWidget {
  final String companyName;
  final String companyLocation;
  final bool hiddenName;

  CustomCompanyInformationCard({
    required this.companyName,
    required this.companyLocation,
    required this.hiddenName,
});

  @override
  Widget build(BuildContext context) {
    String displayedCompanyName = hiddenName ? 'unknown'.tr : companyName;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          text: displayedCompanyName,
          color: primaryBlackColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(
          height: 4.0,
        ),
        CustomText(
          text: companyLocation,
          color: orangeColor,
          fontSize: 16,
        ),
      ],
    );
  }
}
