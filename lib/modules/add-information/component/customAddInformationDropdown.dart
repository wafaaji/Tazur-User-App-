import 'package:flutter/material.dart';
import 'package:graduation_project/components/customDropDown.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomAddInformationDropdown extends StatelessWidget {
  final String title;
  final List<dynamic> items;
  final dynamic value;
  final Function(String)? onChanged;

  CustomAddInformationDropdown({
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryGreenColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
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
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomDropdown(
                  items: items,
                  value: value,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
