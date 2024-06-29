import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/add-information/addInformationController.dart';
import 'package:graduation_project/modules/add-information/component/customAddInformationDropdown.dart';
import 'package:graduation_project/components/multi-select-dropdown/customSelectMultiDropdown.dart';

class TargetJobScreen extends GetView<AddInformationController> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // Topic
          CustomSelectMultiDropdown(
            controller: controller,
            title: 'topic'.tr,
            text: 'click here to select topic'.tr,
            onPressed: () {
              controller.showMultiSelectTopic();
            },

            widget: Obx((){
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Wrap(
                  children: controller.selectedTopicItems
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
          // Job Environment
          CustomSelectMultiDropdown(
            controller: controller,
            title: 'job environment'.tr,
            text: 'click here to select job environment'.tr,
            onPressed: () {
              controller.showMultiSelectJobEnvironment();
            },

            widget: Obx((){
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Wrap(
                  children: controller.selectedJobEnvironmentItems
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
          // Job Time
          CustomSelectMultiDropdown(
            controller: controller,
            title: 'job time'.tr,
            text: 'click here to select job time'.tr,
            onPressed: () {
              controller.showMultiSelectJobTime();
            },

            widget: Obx((){
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Wrap(
                  children: controller.selectedJobTimeItems
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
          // Work City
          CustomSelectMultiDropdown(
            controller: controller,
            title: 'work city'.tr,
            text: 'click here to select work city'.tr,
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
            height: 20,
          ),
          // Current Job
          Obx((){
            return CustomAddInformationDropdown(
              title: 'current job'.tr,
              items: currentJobItems,
              value: controller.selectCurrentJob.value,
              onChanged: (newValue) {
                controller.setSelectedCurrentJob(newValue);
              },
            );
          }),
        ],
      ),
    );
  }
}
