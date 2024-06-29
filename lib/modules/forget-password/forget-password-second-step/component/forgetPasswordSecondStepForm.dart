import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/forget-password/forget-password-second-step/forgetPasswordSecondStepController.dart';

class ForgetPasswordSecondStepForm extends GetView<ForgetPasswordSecondStepController> {

  final GlobalKey<FormState> forgetPasswordSecondStepFormKey;

  const ForgetPasswordSecondStepForm({
    required this.forgetPasswordSecondStepFormKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgetPasswordSecondStepFormKey,
      child: Column(
        children: [
          Container(
            width: 320.0,
            height: 60.0,
            child: Obx((){
              return CustomTextField(
                controller: controller.passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.isPassword.value,
                onSaved: (value) {
                  controller.password = value!;
                },
                validator: (value) {
                  return controller.validatePassword(value!);
                },
                decoration: InputDecoration(
                  hintText: 'password'.tr,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: primaryBlackColor,
                    ),
                    onPressed: () {
                      controller.changePassword();
                    },
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 320.0,
            height: 60.0,
            child: Obx((){
              return CustomTextField(
                controller: controller.confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.isConfirmPassword.value,
                onSaved: (value) {
                  controller.confirmPassword = value!;
                },
                validator: (value) {
                  return controller.validateConfirmPassword(controller.passwordController.text, value ?? '');
                },
                decoration: InputDecoration(
                  hintText: 'confirm password'.tr,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: primaryBlackColor,
                    ),
                    onPressed: () {
                      controller.changeConfirmPassword();
                    },
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
