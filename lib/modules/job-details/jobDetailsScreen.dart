import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/job-details/details-screens/jobDetailsScreenFour.dart';
import 'package:graduation_project/modules/job-details/details-screens/jobDetailsScreenOne.dart';
import 'package:graduation_project/modules/job-details/details-screens/jobDetailsScreenThree.dart';
import 'package:graduation_project/modules/job-details/details-screens/jobDetailsScreenTwo.dart';
import 'package:graduation_project/modules/job-details/jobDetailsController.dart';

class JobDetailsScreen extends StatelessWidget {
  JobDetailsController controller = Get.put(JobDetailsController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      JobDetailsScreenOne(),
      JobDetailsScreenTwo(),
      JobDetailsScreenThree(),
      JobDetailsScreenFour(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        iconTheme: IconThemeData(color: primaryWhiteColor),
        title: CustomText(
          text: 'job details'.tr,
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
                  if(controller.applyJob()){
                    controller.printQuestionsWithAnswers();
                  onClickApply();
                  }
                },
                text: 'apply button'.tr,
                backgroundColor: orangeColor,
                overlayColor: orangeColor.withOpacity(0.50),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // For Login Button
  void onClickApply() async {

    CustomEasyLoading.showLoading();

    // Await the completion of applyOnClick method
    await controller.applyOnClick();

    // Dismiss loading indicator
    CustomEasyLoading.dismiss();

    if (controller.applyStatus) {
      CustomEasyLoading.showSuccess(controller.message);
    } else {
      CustomEasyLoading.showError(controller.message);
    }
  }

}
