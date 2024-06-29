import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/cv-information/component/customTextFieldCVInformation.dart';
import 'package:graduation_project/modules/link/updateLinkController.dart';

class UpdateLinkScreen extends StatelessWidget {
  final UpdateLinkController controller = Get.put(UpdateLinkController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'update link'.tr,
        onPressed: () {
          Get.offNamed('/cvInformation');
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
                  // Link Title
                  customTextFieldCVInformation(
                    label: 'link title'.tr,
                    controller: controller.linkTitleController,
                    onSaved: (value) {
                      controller.linkTitle.value = value!;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Link
                  customTextFieldCVInformation(
                    label: 'link'.tr,
                    controller: controller.linkController,
                    onSaved: (value) {
                      controller.link.value = value!;
                    },
                  ),
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

    await controller.UpdateLink();
    CustomEasyLoading.dismiss();

    if (controller.updateLinkStatus) {
      CustomEasyLoading.showSuccess(controller.message);
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }
}
