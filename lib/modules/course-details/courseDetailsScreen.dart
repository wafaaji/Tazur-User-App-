import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/course-details/courseDetailsController.dart';
import 'package:graduation_project/modules/course-details/details-screens/courseDetailsScreenOne.dart';
import 'package:graduation_project/modules/course-details/details-screens/courseDetailsScreenTwo.dart';

class CourseDetailsScreen extends StatelessWidget {
  CourseDetailsController controller = Get.put(CourseDetailsController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      CourseDetailsScreenOne(),
      CourseDetailsScreenTwo(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        iconTheme: IconThemeData(color: primaryWhiteColor),
        title: CustomText(
          text: 'Course details'.tr,
          color: primaryWhiteColor,
          fontSize: 25,
        ),
        centerTitle: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              children:_screens,
              onPageChanged: controller.onPageChanged,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryWhiteColor,
        shadowColor: primaryBlackColor,
        surfaceTintColor: primaryWhiteColor,
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx((){
                return Row(
                  children: List.generate(
                    _screens.length,
                        (index) => Container(
                      width: 10,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentIndex == index
                            ? primaryGreenColor
                            : primaryBlackColor.withOpacity(0.50),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              CustomElevatedButton(
                onPressed: () {
                  onClickInterested();
                },
                text: 'interested button'.tr,
                backgroundColor: orangeColor,
                overlayColor: orangeColor.withOpacity(0.50),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // For Interested Button
  void onClickInterested() async {
    CustomEasyLoading.showLoading();

    // Await the completion of applyOnClick method
    await controller.interestedOnClick();

    // Dismiss loading indicator
    CustomEasyLoading.dismiss();

    if (controller.interestedStatus) {
      CustomEasyLoading.showSuccess(controller.message);
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

}
