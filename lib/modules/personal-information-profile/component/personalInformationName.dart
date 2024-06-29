import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';

class PersonalInformationName extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final Function(String?)? onSavedFirstName;
  final Function(String?)? onSavedLastName;

  PersonalInformationName({
    required this.firstNameController,
    required this.lastNameController,
    required this.onSavedFirstName,
    required this.onSavedLastName,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
              text: 'name'.tr,
              color: primaryBlackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50.0,
              child: CustomTextField(
                controller: firstNameController,
                keyboardType: TextInputType.text,
                onSaved: onSavedFirstName,
                decoration: InputDecoration(),
                useEnabledBorder: false,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50.0,
              child: CustomTextField(
                controller: lastNameController,
                keyboardType: TextInputType.text,
                onSaved: onSavedLastName,
                decoration: InputDecoration(),
                useEnabledBorder: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
