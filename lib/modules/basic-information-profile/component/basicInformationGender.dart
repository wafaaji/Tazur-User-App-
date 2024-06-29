import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customRadioButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class BasicInformationGender extends StatelessWidget {
  final int groupValueMale;
  final void Function(int?) onChangedMale;
  final int groupValueFemale;
  final void Function(int?) onChangedFemale;

  const BasicInformationGender({
    required this.groupValueMale,
    required this.onChangedMale,
    required this.groupValueFemale,
    required this.onChangedFemale,
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
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'gender'.tr,
              color: primaryBlackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: secondaryWhiteColor,
                  ),
                  child: CustomRadioButton(
                      title: 'male'.tr,
                      value: 1,
                      groupValue: groupValueMale,
                      onChanged: onChangedMale,
                    ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: secondaryWhiteColor,
                  ),
                  child: CustomRadioButton(
                      title: 'female'.tr,
                      value: 2,
                      groupValue: groupValueFemale,
                      onChanged: onChangedFemale,
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
