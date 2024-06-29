import 'package:flutter/material.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';

class customTextFieldCVInformation extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final String label;

  const customTextFieldCVInformation({
    Key? key,
    required this.controller,
    required this.onSaved,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryGreenColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: label,
              color: primaryBlackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 2),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50.0,
              child: CustomTextField(
                controller: controller,
                keyboardType: TextInputType.text,
                onSaved: onSaved,
                decoration: InputDecoration(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
