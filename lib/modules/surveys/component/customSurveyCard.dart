import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customCircleAvatar.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomSurveyCard extends StatelessWidget {
  final String imagePath;
  final String companyName;
  final String surveyTitle;
  final VoidCallback onPressed;

  const CustomSurveyCard({
    required this.imagePath,
    required this.companyName,
    required this.surveyTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.only(bottom: 20.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: secondaryWhiteColor,
          ),
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCircleAvatar(
                imagePath: imagePath,
                radius: 40.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: companyName,
                      color: primaryBlackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    CustomText(
                      text: surveyTitle,
                      color: primaryBlackColor.withOpacity(0.50),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: CustomElevatedButton(
                  onPressed: onPressed,
                  text: 'start button'.tr,
                  width: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
