import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/auth/authController.dart';

class CustomToggleButtons extends StatelessWidget {
  final List<String> labels;
  final AuthController authController;

  CustomToggleButtons({
    required this.labels,
    required this.authController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return ToggleButtons(
        children: [
          for (var label in labels)
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(label),
            ),
        ],
        onPressed: (int index) {
          authController.selectIndex(index);
          if (index == 0)
            Get.toNamed('/register');
          else
            Get.toNamed('/login');
        },
        isSelected: [
          authController.selectedIndex.value == 0,
          authController.selectedIndex.value == 1,
        ],
        selectedColor: primaryWhiteColor,
        color: primaryGreenColor,
        fillColor: primaryGreenColor,
        borderRadius: BorderRadius.circular(10),
        selectedBorderColor: primaryGreenColor,
        disabledBorderColor: primaryGreenColor,
        borderColor: primaryGreenColor,
        borderWidth: 1,
        mouseCursor: MaterialStateMouseCursor.clickable,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
        ),
      );
    });
  }
}
