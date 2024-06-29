import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/modules/forget-password/forget-password-first-step/forgetPasswordFirstStepController.dart';

class ForgetPasswordFirstStepForm extends GetView<ForgetPasswordFirstStepController> {
  final GlobalKey<FormState> forgetPasswordFirstStepFormKey;

  const ForgetPasswordFirstStepForm({
    required this.forgetPasswordFirstStepFormKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgetPasswordFirstStepFormKey,
      child: Center(
        child: Container(
          width: 320.0,
          height: 60.0,
          child: CustomTextField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction : TextInputAction.next,
            onSaved: (value) {
              controller.email = value!;
            },
            validator: (value) {
              return controller.validateEmail(value!);
            },
            decoration: InputDecoration(
              hintText: 'email'.tr,
            ),
          ),
        ),
      ),
    );
  }
}
