import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/modules/personal-information-profile/component/personalInformationImage.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/personal-information-profile/component/customUpdateInformationDropdown.dart';
import 'package:graduation_project/modules/personal-information-profile/component/personalInformationName.dart';
import 'package:graduation_project/modules/personal-information-profile/personalInformationController.dart';

class ProfilePersonalInformationScreen extends StatelessWidget {
  final PersonalInformationController controller = Get.put(PersonalInformationController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'personal information'.tr,
        onPressed: () {
          Get.offNamed('/home');
        },
        isArabic: isArabic,
      ),
      body: Obx(() {
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // Image
                  Obx(() {
                    ImageProvider<Object>? backgroundImage;

                    if (controller.isProfilePicPathSet.value) {
                      backgroundImage = FileImage(File(controller.profilePicPath.value));
                    } else if (controller.profilePicPath.value.isNotEmpty &&
                        controller.profilePicPath.value != "http://86.38.218.161:8080/") {
                      backgroundImage = NetworkImage(controller.profilePicPath.value);
                    } else {
                      backgroundImage = AssetImage('assets/images/profile.jpg');
                    }

                    return PersonalInformationImage(
                      key: ValueKey(controller.profilePicPath.value),
                      backgroundImage: backgroundImage,
                    );
                  }),

                  SizedBox(
                    height: 20.0,
                  ),
                  // Name
                  PersonalInformationName(
                    firstNameController: controller.firstNameController,
                    onSavedFirstName: (value) {
                      controller.firstName.value = value!;
                    },
                    lastNameController: controller.lastNameController,
                    onSavedLastName: (value) {
                      controller.lastName.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Phone
                  Container(
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
                            text: 'phone'.tr,
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
                              controller: controller.phoneController,
                              keyboardType: TextInputType.text,
                              onSaved: (value) {
                                controller.phone.value = value!;
                              },
                              decoration: InputDecoration(),
                              useEnabledBorder: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Governorate
                  Obx(() {
                    return CustomUpdateInformationDropdown(
                      title: 'governorate'.tr,
                      items: governorateItems,
                      value: controller.selectGovernorate.value,
                      onChanged: (newValue) {
                        controller.setSelectedGovernorate(newValue!);
                      },
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  // Address
                  Container(
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
                            text: 'address'.tr,
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
                              controller: controller.addressController,
                              keyboardType: TextInputType.text,
                              onSaved: (value) {
                                controller.address.value = value!;
                              },
                              decoration: InputDecoration(),
                              useEnabledBorder: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Family State
                  Obx(() {
                    return CustomUpdateInformationDropdown(
                      title: 'family state'.tr,
                      items: familyStateItems,
                      value: controller.selectFamilyState.value,
                      onChanged: (newValue) {
                        controller.setSelectedFamilyState(newValue!);
                      },
                    );
                  }),
                  SizedBox(
                    height: 20,
                  ),
                  // Nationality
                  Obx(() {
                    return CustomUpdateInformationDropdown(
                      title: 'nationality'.tr,
                      items: nationalityItems,
                      value: controller.selectNationality.value,
                      onChanged: (newValue) {
                        controller.setSelectedNationality(newValue!);
                      },
                    );
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

    await controller.updatePersonalInformation();
    CustomEasyLoading.dismiss();

    if (controller.updatePersonalInformationStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      Get.offNamed('/home');
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}