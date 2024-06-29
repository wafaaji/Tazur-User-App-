import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:graduation_project/constants.dart';

class CustomEasyLoading {
  static void showLoading() {
    EasyLoading.instance
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..indicatorColor = secondaryWhiteColor
      ..indicatorSize = 45.0
      ..textColor = secondaryWhiteColor
      ..backgroundColor = primaryBlackColor.withOpacity(0.5)
      ..animationStyle = EasyLoadingAnimationStyle.scale;

    EasyLoading.show(status: "loading".tr);
  }

  static void showSuccess(String message) {
    EasyLoading.showSuccess(
      message,
      duration: Duration(milliseconds: 2000),
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static void showError(String message) {
    EasyLoading.showError(
      message,
      duration: Duration(milliseconds: 2000),
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
    );
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
