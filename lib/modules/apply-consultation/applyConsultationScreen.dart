import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/apply-consultation/applyConsultationController.dart';

class ApplyConsultationScreen extends StatelessWidget {
  final ApplyConsultationController controller = Get.put(ApplyConsultationController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: CustomAppBar(
        title: 'apply consultation'.tr,
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
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.02,
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                child: CustomText(
                  text: 'first text'.tr,
                  color: primaryBlackColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // Topic
              Obx(() {
                return Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: primaryGreenColor,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.8,
                      child: SingleChildScrollView( // Wrap the DropdownButton with SingleChildScrollView
                        scrollDirection: Axis.horizontal,
                        // Set the scrolling direction to horizontal
                        child: DropdownButton<String>(
                          value: controller.selectTopic.value,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              controller.setSelectedTopic(newValue);
                            }
                          },
                          items: controller.userTopicItems.map((String topic) {
                            return DropdownMenuItem<String>(
                              value: topic,
                              child: Text(controller.translateValue(topic)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 20.0,
              ),
              // The Message
              CustomTextField(
                controller: controller.consultationController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: 'second text'.tr,
                ),
                hintSize: 14.0,
                hintColor: primaryBlackColor.withOpacity(0.50),
              ),
              // Send Button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomElevatedButton(
                        onPressed: () {
                          onClickSend();
                        },
                        text: 'send button'.tr,
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      );
    }
      }),
    );
  }

  // For Send Button
  void onClickSend() async {
    CustomEasyLoading.showLoading();

    // Await the completion of applyOnClick method
    await controller.sendOnClick();

    // Dismiss loading indicator
    CustomEasyLoading.dismiss();

    if (controller.sendConsultationStatus) {
      CustomEasyLoading.showSuccess(controller.message);
      Get.offNamed('/consultation');
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

}
