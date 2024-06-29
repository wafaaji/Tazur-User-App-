import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/components/customTextField.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/login/loginController.dart';

class LoginForm extends GetView<LoginController> {

  final GlobalKey<FormState> loginFormKey;

  const LoginForm({
    required this.loginFormKey,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 2000),
      child: Form(
        key: loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
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
            SizedBox(
              height: 20.0,
            ),
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
                  // validator: (value) {
                  //   return controller.validatePassword(value!);
                  // },
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
              height: 10.0,
            ),
            CustomTextButton(
              onPressed: (){
                Get.toNamed('/forgetPasswordFirstStep');
              },
              text: 'forget password'.tr,
              color: orangeColor,
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
