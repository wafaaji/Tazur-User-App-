import 'package:flutter/material.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/constants.dart';

class CustomSelectMultiDropdown extends StatelessWidget {

  final BaseController controller;
  final String title;
  final String text;
  final Function() onPressed;
  final Widget widget;


  CustomSelectMultiDropdown({
    required this.controller,
    required this.title,
    required this.text,
    required this.onPressed,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryGreenColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              color: primaryBlackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: secondaryWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextButton(
                    onPressed: onPressed,
                    text: text,
                    color: primaryBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  widget
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}