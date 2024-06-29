import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/modules/add-information/addInformationController.dart';
import 'package:graduation_project/constants.dart';

class AddInformationScreen extends GetView<AddInformationController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Get.previousRoute == '/login') {
          Get.toNamed('/login');
        } else {
          Get.toNamed('/auth');
        }
        return false; // Prevent default back navigation
      },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Center(
              child: CustomText(
                text: 'add information title'.tr,
                color: primaryBlackColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Obx(
                () => Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: orangeColor),
              ),
              child: Form(
                key: _formKey,
                child: Stepper(
                  type: StepperType.horizontal,
                  physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  onStepTapped: null,
                  steps: controller.getSteps(),
                  currentStep: controller.currentStep.value,
                  connectorThickness: 4.0,
                  onStepContinue: () {
                    if (_formKey.currentState!.validate()) {
                      _scrollController.jumpTo(0);
                      controller.handleContinue();
                    }
                  },
                  onStepCancel: () {
                    _scrollController.jumpTo(0);
                    controller.handleCancel();
                  },
                  controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
                    final isLastStep = controller.currentStep.value == controller.getSteps().length - 1;
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          if (controller.currentStep.value != 0)
                            Expanded(
                              child: CustomElevatedButton(
                                onPressed: (){
                                  controlsDetails.onStepCancel?.call();
                                },
                                text: 'back button'.tr,
                                textColor: primaryGreenColor,
                                borderColor: primaryGreenColor,
                                backgroundColor:primaryWhiteColor,
                              ),
                            ),
                          SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: isLastStep ? CustomElevatedButton(
                              onPressed:(){
                                // Call onClickConfirm only when last step is reached
                                onClickConfirm();
                              },
                              text: "confirm button".tr,
                            ) : CustomElevatedButton(
                              onPressed:(){
                                controlsDetails.onStepContinue?.call();
                              },
                              text: "next button".tr,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
    );
  }

// For Confirm Button
  void onClickConfirm() async {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      // Check if any required field is empty
      if (controller.selectedTopicItems.isEmpty) {
        // Show an error message if any required field is empty
        Get.snackbar(
          'error'.tr,
          'topic valid'.tr,
          snackPosition: SnackPosition.TOP,
        );
        return;
      } else if (controller.selectedJobEnvironmentItems.isEmpty) {
        // Show an error message if any required field is empty
        Get.snackbar(
          'error'.tr,
          'job environment valid'.tr,
          snackPosition: SnackPosition.TOP,
        );
        return;
      } else if (controller.selectedJobTimeItems.isEmpty) {
        // Show an error message if any required field is empty
        Get.snackbar(
          'error'.tr,
          'job time valid'.tr,
          snackPosition: SnackPosition.TOP,
        );
        return;
      } else if (controller.selectedWorkCityItems.isEmpty) {
        // Show an error message if any required field is empty
        Get.snackbar(
          'error'.tr,
          'work city valid'.tr,
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
      CustomEasyLoading.showLoading();

      await controller.AddInformationOnClick();
      CustomEasyLoading.dismiss();

      if (controller.addInformationStatus) {
        CustomEasyLoading.showSuccess(controller.message);
        Get.offAllNamed("/home");
      } else {
        CustomEasyLoading.showError(controller.message);
        print("Error Here");
      }
    }
  }

}
