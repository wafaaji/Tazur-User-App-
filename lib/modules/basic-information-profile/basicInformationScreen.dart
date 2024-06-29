import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/basic-information-profile/basicInformationController.dart';
import 'package:graduation_project/modules/basic-information-profile/component/basicInformationBirthday.dart';
import 'package:graduation_project/modules/basic-information-profile/component/basicInformationGender.dart';
import 'package:graduation_project/modules/personal-information-profile/component/customUpdateInformationDropdown.dart';

class ProfileBasicInformationScreen extends StatelessWidget {
  final BasicInformationController controller = Get.put(BasicInformationController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'basic information'.tr,
        onPressed: () {
          Get.back();
        },
        isArabic: isArabic,
      ),
      body: Obx((){
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: primaryGreenColor,
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                // Experience Years
                Obx((){
                  return CustomUpdateInformationDropdown(
                    title: 'experience years'.tr,
                    items: experienceYearsItems,
                    value: controller.selectExperienceYears.value,
                    onChanged: (newValue) {
                      controller.setSelectedExperienceYears(newValue!);
                    },
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                // Education
                Obx((){
                  return CustomUpdateInformationDropdown(
                    title: 'education'.tr,
                    items: educationItems,
                    value: controller.selectEducation.value,
                    onChanged: (newValue) {
                      controller.setSelectedEducation(newValue!);
                    },
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                // Birthday
                BasicInformationBirthday(
                  selectedDayValue: controller.selectedDay.value,
                  onChangedDay: controller.updateSelectedDay,
                  dayItems: controller.days,
                  selectedMonthValue: controller.selectedMonth.value,
                  onChangedMonth: controller.updateSelectedMonth,
                  monthItems: controller.months,
                  selectedYearValue: controller.selectedYear.value,
                  onChangedYear: controller.updateSelectedYear,
                  yearItems: controller.years,
                ),
                SizedBox(
                  height: 20,
                ),
                // Gender
                BasicInformationGender(
                  groupValueMale: controller.selectedGender.value,
                  onChangedMale: (value) {
                    controller.updateSelectedGender(value!);
                  },
                  groupValueFemale: controller.selectedGender.value,
                  onChangedFemale: (value) {
                    controller.updateSelectedGender(value!);
                  },
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
                      ? CustomUpdateInformationDropdown(
                    title: 'military services'.tr,
                    items: militaryServicesItems,
                    value: controller.selectMilitaryServices.value,
                    onChanged: (newValue) {
                      controller.setSelectedMilitaryServices(newValue!);
                    },
                  )
                      : Container();
                }),
                SizedBox(
                  height: 20,
                ),
                // Update Button
                CustomElevatedButton(
                  onPressed: () {
                    onClickUpdate();
                  },
                  text: 'update button'.tr,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }
      }),
    );
  }

  // For Update Button
  void onClickUpdate() async {
    CustomEasyLoading.showLoading();

    await controller.UpdateBasicInformation();
    CustomEasyLoading.dismiss();

    if (controller.updateBasicInformationStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      Get.offNamed('/home');
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}