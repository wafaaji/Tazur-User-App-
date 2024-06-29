import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/multi-select-dropdown/customSelectMultiDropdown.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/companies-filter/companyFilterController.dart';

class CompanyFilterScreen extends GetView<CompanyFilterController> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryWhiteColor,
        leading: IconButton(
          onPressed: (){
            Get.toNamed('/allCompanies');
          },
          icon: isArabic
              ? Transform.rotate(
            angle: pi, // Specify the angle of rotation (in radians)
            child: Image.asset(
              'assets/icons/back button.png',
              height: 30.0,
            ),
          )
              : Image.asset(
            'assets/icons/back button.png',
            height: 30.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'filter screen'.tr,
                  color: primaryBlackColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomText(
                  text: 'filter company text'.tr,
                  color: primaryBlackColor.withOpacity(0.50),
                  fontSize: 16.0,
                ),
                SizedBox(
                    height: 30.0
                ),
                // Topic
                CustomSelectMultiDropdown(
                  controller: controller,
                  title: 'topic'.tr,
                  text: 'click here to select topic'.tr,
                  onPressed: () {
                    controller.showMultiSelectTopicFilter();
                  },

                  widget: Obx((){
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Wrap(
                        children: controller.selectedTopicFilterItems
                            .map((e) => Chip(
                          label: CustomText(
                            text: e,
                            color: primaryBlackColor,
                            fontSize: 15,
                          ),
                        ))
                            .toList(),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                // Course Location
                CustomSelectMultiDropdown(
                  controller: controller,
                  title: 'company filter location'.tr,
                  text: 'click here to select company location'.tr,
                  onPressed: () {
                    controller.showMultiSelectWorkCity();
                  },

                  widget: Obx((){
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Wrap(
                        children: controller.selectedWorkCityItems
                            .map((e) => Chip(
                          label: CustomText(
                            text: e,
                            color: primaryBlackColor,
                            fontSize: 15,
                          ),
                        ))
                            .toList(),
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CustomElevatedButton(
                  onPressed: (){
                    controller.fetchFilterData();
                    Get.toNamed('/filterDisplayCompany');
                  },
                  text: 'select button'.tr,
                  backgroundColor: orangeColor,
                ),
              ]
          ),
        ),
      ),
    );
  }
}
