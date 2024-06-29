import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAssetImage.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/customTextButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/onboarding/onboardingController.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  final SecureStorage storage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: controller.selectedPageIndex,
              itemCount: controller.onboardingScreen.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomAssetImage(
                          imagePath: controller.onboardingScreen[index].image,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: controller.onboardingScreen[index].title,
                        color: primaryBlackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 25.0, right:25.0),
                        child: CustomText(
                          text: controller.onboardingScreen[index].description,
                          color: primaryBlackColor.withOpacity(0.50),
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 30,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextButton(
                    onPressed: (){
                      storage.save('seenOnboarding', true);
                      Get.offAllNamed('/auth');
                    },
                    text: 'skip button'.tr,
                    color: primaryBlackColor,
                  ),
                  Spacer(),
                  Row(
                    children: List.generate(
                      controller.onboardingScreen.length,
                          (index) => Obx(() {
                        return Container(
                          margin: EdgeInsets.all(4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: controller.selectedPageIndex.value == index
                                  ? primaryGreenColor
                                  : primaryBlackColor.withOpacity(0.50),
                              shape: BoxShape.circle
                          ),
                        );
                      }),
                    ),
                  ),
                  Spacer(),
                  Obx((){
                    return CustomTextButton(
                      onPressed: controller.forwardAction,
                      text: controller.isLastPage ? 'start button'.tr : 'next button'.tr,
                      color: primaryGreenColor,

                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}