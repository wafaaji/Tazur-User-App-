import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/PINCode/PINCodeController.dart';
import 'package:graduation_project/modules/PINCode/component/customPINInput.dart';

class PINForm extends GetView<PINCodeController> {
  final GlobalKey<FormState> PINCodeFormKey;

  final FocusNode pin1FocusNode = FocusNode();
  final FocusNode pin2FocusNode = FocusNode();
  final FocusNode pin3FocusNode = FocusNode();
  final FocusNode pin4FocusNode = FocusNode();

  PINForm({
    required this.PINCodeFormKey,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return Form(
      key: PINCodeFormKey,
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: isRTL
            ? [
              // Arabic Version
            SizedBox(
            height: 68,
            width: 64,
            child: Container(
              decoration: BoxDecoration(
                color: secondaryWhiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CustomPinInput(
                  controller: controller.pin4Controller,
                  focusNode: pin4FocusNode,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  onSaved: (value) {
                    controller.pin4 = value!;
                  },
                  validator: (value) {
                    return controller.validatePINCode(value!);
                  },
                ),
              ),
            ),
          ),
            SizedBox(
              height: 68,
              width: 64,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:  CustomPinInput(
                    controller: controller.pin3Controller,
                    focusNode: pin3FocusNode,
                    nextFocusNode: pin4FocusNode,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4FocusNode.requestFocus();
                      }
                    },
                    onSaved: (value) {
                      controller.pin3 = value!;
                    },
                    validator: (value) {
                      return controller.validatePINCode(value!);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:  CustomPinInput(
                    controller: controller.pin2Controller,
                    focusNode: pin2FocusNode, // Assign FocusNode
                    nextFocusNode: pin3FocusNode,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin3FocusNode.requestFocus();
                      }
                    },
                    onSaved: (value) {
                      controller.pin2 = value!;
                    },
                    validator: (value) {
                      return controller.validatePINCode(value!);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:  CustomPinInput(
                    controller: controller.pin1Controller,
                    focusNode: pin1FocusNode, // Assign FocusNode
                    nextFocusNode: pin2FocusNode,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin2FocusNode.requestFocus();
                      }
                    },
                    onSaved: (value) {
                      controller.pin1 = value!;
                    },
                    validator: (value) {
                      return controller.validatePINCode(value!);
                    },
                  ),
                ),
              ),
            ),
          ]
          : [
            // English Version
            SizedBox(
              height: 68,
              width: 64,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CustomPinInput(
                    controller: controller.pin1Controller,
                    focusNode: pin1FocusNode, // Assign FocusNode
                    nextFocusNode: pin2FocusNode,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin2FocusNode.requestFocus();
                      }
                    },
                    onSaved: (value) {
                      controller.pin1 = value!;
                    },
                    validator: (value) {
                      return controller.validatePINCode(value!);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:  CustomPinInput(
                    controller: controller.pin2Controller,
                    focusNode: pin2FocusNode, // Assign FocusNode
                    nextFocusNode: pin3FocusNode,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin3FocusNode.requestFocus();
                      }
                    },
                    onSaved: (value) {
                      controller.pin2 = value!;
                    },
                    validator: (value) {
                      return controller.validatePINCode(value!);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:  CustomPinInput(
                    controller: controller.pin3Controller,
                    focusNode: pin3FocusNode,
                    nextFocusNode: pin4FocusNode,
                    onChanged: (value) {
                      if (value.length == 1) {
                        pin4FocusNode.requestFocus();
                      }
                    },
                    onSaved: (value) {
                      controller.pin3 = value!;
                    },
                    validator: (value) {
                      return controller.validatePINCode(value!);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child:  CustomPinInput(
                    controller: controller.pin4Controller,
                    focusNode: pin4FocusNode,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                    onSaved: (value) {
                      controller.pin4 = value!;
                    },
                    validator: (value) {
                      return controller.validatePINCode(value!);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
