import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customElevatedButton.dart';

class CustomProfileButtons extends StatelessWidget {
  final VoidCallback uploadOnPressed;
  final VoidCallback downloadOnPressed;

  const CustomProfileButtons({
    Key? key,
    required this.uploadOnPressed,
    required this.downloadOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomElevatedButton(
              onPressed: uploadOnPressed,
              text: 'upload cv button'.tr,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: CustomElevatedButton(
              onPressed: downloadOnPressed,
              text: 'download cv button'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
