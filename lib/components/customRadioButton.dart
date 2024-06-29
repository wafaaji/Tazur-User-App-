import 'package:flutter/material.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final Function(int?) onChanged;

  const CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
            activeColor: primaryGreenColor,
            materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
        SizedBox(width: 10,),
        CustomText(
            text: title,
          color: primaryBlackColor,
          fontSize: 16,
        ),
      ],
    );
  }
}
