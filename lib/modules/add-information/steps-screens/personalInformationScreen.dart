import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/add-information/addInformationController.dart';
import 'package:graduation_project/modules/add-information/component/customAddInformationDropdown.dart';
import 'package:graduation_project/modules/add-information/component/customAddInformationTextFiled.dart';

class PersonalInformationScreen extends GetView<AddInformationController> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController controllerFirstName;
  final TextEditingController controllerLastName;
  final TextEditingController controllerAddress;

  PersonalInformationScreen({
    required this.controllerFirstName,
    required this.controllerLastName,
    required this.controllerAddress,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // Name
          Container(
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
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    child: CustomTextField(
                      controller: controllerFirstName,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        controller.firstName = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'first name valid'.tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'first name'.tr,
                      ),
                      hintColor: primaryBlackColor.withOpacity(0.50),
                      hintSize: 14,
                      useEnabledBorder: false,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50.0,
                    child: CustomTextField(
                      controller: controllerLastName,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        controller.lastName = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'last name valid'.tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'last name'.tr,
                      ),
                      hintColor: primaryBlackColor.withOpacity(0.50),
                      hintSize: 14,
                      useEnabledBorder: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Governorate
          Obx((){
            return CustomAddInformationDropdown(
              title: 'governorate'.tr,
              items: governorateItems,
              value: controller.selectGovernorate.value,
              onChanged: (newValue) {
                controller.setSelectedGovernorate(newValue);
              },
            );
          }),
          SizedBox(
            height: 20,
          ),
          // Address
          CustomAddInformationTextFiled(
            title: 'address'.tr,
            controller: controllerAddress,
            onSaved: (value) {
              controller.address = value!;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'address valid'.tr;
              }
              return null;
            },
            hintText: 'address name'.tr,
          ),
          SizedBox(
            height: 20,
          ),
          // Family State
          Obx((){
            return CustomAddInformationDropdown(
              title: 'family state'.tr,
              items: familyStateItems,
              value: controller.selectFamilyState.value,
              onChanged: (newValue) {
                controller.setSelectedFamilyState(newValue);
              },
            );
          }),
          SizedBox(
            height: 20,
          ),
          // Nationality
          Obx((){
            return CustomAddInformationDropdown(
              title: 'nationality'.tr,
              items: nationalityItems,
              value: controller.selectNationality.value,
              onChanged: (newValue) {
                controller.setSelectedNationality(newValue);
              },
            );
          }),
        ],
      ),
    );
  }
}
