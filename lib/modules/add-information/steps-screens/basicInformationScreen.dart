import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customRadioButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/add-information/addInformationController.dart';
import 'package:graduation_project/modules/add-information/component/customAddInformationDropdown.dart';

class BasicInformationScreen extends GetView<AddInformationController> {
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // Experience Years
          Obx((){
            return CustomAddInformationDropdown(
              title: 'experience years'.tr,
              items: experienceYearsItems,
              value: controller.selectExperienceYears.value,
              onChanged: (newValue) {
                controller.setSelectedExperienceYears(newValue);
              },
            );
          }),
          SizedBox(
            height: 20,
          ),
          // Education
          Obx((){
            return CustomAddInformationDropdown(
              title: 'education'.tr,
              items: educationItems,
              value: controller.selectEducation.value,
              onChanged: (newValue) {
                controller.setSelectedEducation(newValue);
              },
            );
          }),
          SizedBox(
            height: 20,
          ),
          // Birthday
          Container(
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
                    text: 'birthday'.tr,
                    color: primaryBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                 Obx((){
                   return  Row(
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
                             value: controller.selectedDay.value,
                             onChanged: controller.updateSelectedDay,
                             items: controller.days.map((int day) {
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
                             value: controller.selectedMonth.value,
                             onChanged: controller.updateSelectedMonth,
                             items: controller.months.map((int month) {
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
                             value: controller.selectedYear.value,
                             onChanged: controller.updateSelectedYear,
                             items: controller.years.map((int year) {
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
                   );
                 }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Gender
          Container(
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
                        child: Obx((){
                          return CustomRadioButton(
                            title: 'male'.tr,
                            value: 1,
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.updateSelectedGender(value!);
                            },
                          );
                        }),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: secondaryWhiteColor,
                        ),
                        child: Obx((){
                          return CustomRadioButton(
                            title: 'female'.tr,
                            value: 2,
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) {
                              controller.updateSelectedGender(value!);
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Driver Licence
          Obx((){
            return  Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: secondaryWhiteColor,
                border: Border.all(
                  color: controller.driverLicense.value ? primaryGreenColor : secondaryWhiteColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'driver licence'.tr,
                      color: controller.driverLicense.value ? primaryGreenColor : primaryBlackColor,
                      fontSize: 16,
                    ),
                    Checkbox(
                      value: controller.driverLicense.value,
                      onChanged: controller.toggleDriverLicense,
                      checkColor: primaryWhiteColor ,
                      fillColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return primaryGreenColor;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(
            height: 20,
          ),
          // Military Services
          Obx(() {
            return controller.selectedGender.value == 1 // 1 represents male
                ? CustomAddInformationDropdown(
              title: 'military services'.tr,
              items: militaryServicesItems,
              value: controller.selectMilitaryServices.value,
              onChanged: (newValue) {
                controller.setSelectedMilitaryServices(newValue);
              },
            )
                : Container();
          }),
        ],
      ),
    );
  }
}
