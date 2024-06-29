import 'package:flutter/material.dart';
import 'package:graduation_project/modules/onboarding/onboardingInfo.dart';
import 'package:get/get.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class OnboardingController extends GetxController {
    var selectedPageIndex = 0.obs;
    var pageController = PageController();
    final SecureStorage storage = SecureStorage();

    bool get isLastPage => selectedPageIndex.value == onboardingScreen.length - 1;

    forwardAction(){
        if(isLastPage){
            storage.save('seenOnboarding', true);
            Get.offAllNamed('/auth');
        }else {
            pageController.nextPage(
                duration: 300.milliseconds, curve: Curves.ease);
        }
    }

    List<OnboardingInfo> onboardingScreen = [
        OnboardingInfo(
            'assets/images/onboarding-image/onboarding1.png',
            'first title'.tr,
            'first description'.tr,
        ),
        OnboardingInfo(
            'assets/images/onboarding-image/onboarding2.png',
            'Second title'.tr,
            'Second description'.tr,
        ),
        OnboardingInfo(
            'assets/images/onboarding-image/onboarding3.png',
            'third title'.tr,
            'third description'.tr,
        ),
        OnboardingInfo(
            'assets/images/onboarding-image/onboarding4.png',
            'fourth title'.tr,
            'fourth description'.tr,
        ),
    ];

}