import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/multi-select-dropdown/customSelectMultiDropdown.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/personal-information-profile/component/customUpdateInformationDropdown.dart';
import 'package:graduation_project/modules/terget-job-profile/targetJobController.dart';

class ProfileTargetJobScreen extends StatelessWidget {
  final TargetJobController controller = Get.put(TargetJobController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'target job'.tr,
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
                  return CustomUpdateInformationDropdown(
                    title: 'current job'.tr,
                    items: currentJobItems,
                    value: controller.selectCurrentJob.value,
                    onChanged: (newValue) {
                      controller.setSelectedCurrentJob(newValue!);
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

    await controller.UpdateTargetJob();
    CustomEasyLoading.dismiss();

    if (controller.updateTargetJobStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      Get.offNamed('/home');
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}
