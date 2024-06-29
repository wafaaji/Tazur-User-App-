import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class BasicInformationBirthday extends StatelessWidget {
  final int selectedDayValue;
  final ValueChanged<int?>? onChangedDay;
  final List<int> dayItems;
  final int selectedMonthValue;
  final ValueChanged<int?>? onChangedMonth;
  final List<int> monthItems;
  final int selectedYearValue;
  final ValueChanged<int?>? onChangedYear;
  final List<int> yearItems;

  const BasicInformationBirthday({
    required this.selectedDayValue,
    required this.onChangedDay,
    required this.dayItems,
    required this.selectedMonthValue,
    required this.onChangedMonth,
    required this.monthItems,
    required this.selectedYearValue,
    required this.onChangedYear,
    required this.yearItems,
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'birthday'.tr,
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
                    // Day
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: secondaryWhiteColor,
                      ),
                      child: Center(
                        child: DropdownButton<int>(
                          value: selectedDayValue,
                          onChanged: onChangedDay,
                          items: dayItems.map((int day) {
                            return DropdownMenuItem<int>(
                              value: day,
                              child: CustomText(
                                text: '$day',
                                color: primaryBlackColor,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    // Month
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: secondaryWhiteColor,
                      ),
                      child: Center(
                        child: DropdownButton<int>(
                          value: selectedMonthValue,
                          onChanged: onChangedMonth,
                          items: monthItems.map((int month) {
                            return DropdownMenuItem<int>(
                              value: month,
                              child: CustomText(
                                text: '$month',
                                color: primaryBlackColor,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    // Year
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: secondaryWhiteColor,
                      ),
                      child: Center(
                        child: DropdownButton<int>(
                          value: selectedYearValue,
                          onChanged: onChangedYear,
                          items: yearItems.map((int year) {
                            return DropdownMenuItem<int>(
                              value: year,
                              child: CustomText(
                                text: '$year',
                                color: primaryBlackColor,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}