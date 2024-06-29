import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customCircleAvatar.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/survey-details/surveyDetailsController.dart';

class SurveyDetailsScreen extends StatelessWidget {
  final SurveyDetailsController controller = Get.put(SurveyDetailsController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryWhiteColor,
        leading: IconButton(
          onPressed: () {
            Get.offNamed('/surveys');
          },
          icon: isArabic
              ? Transform.rotate(
            angle: pi,
            child: Image.asset(
              'assets/icons/back button.png',
              height: 30.0,
            ),
          )
              : Image.asset(
            'assets/icons/back button.png',
            height: 30.0,
          ),
        ),
        title: Obx(() => CustomText(
          // Use survey title from the controller
          text: controller.surveyDetails.value?.title ?? 'N/A',
          color: primaryBlackColor,
        )),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() {
          // Once survey details are loaded, display them
          if (controller.surveyDetails.value != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomCircleAvatar(
                      imagePath: controller.surveyDetails.value!.company.logo,
                      radius: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    CustomText(
                      // Use company name from survey details
                      text: controller.surveyDetails.value!.company.name,
                      color: primaryBlackColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomText(
                  // Use survey description from survey details
                  text: controller.surveyDetails.value!.description,
                  color: primaryBlackColor,
                  fontSize: 18.0,
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    controller.surveyDetails.value!.options.length,
                        (index) => GestureDetector(
                      onTap: () {
                        controller.selectOptionById(controller.surveyDetails.value!.options[index].id);
                        controller.voteOnClick();
                      },
                      child: Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 20),
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: controller.selectedOptionIndex.value == index
                              ? primaryGreenColor
                              : secondaryWhiteColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: CustomText(
                                text: controller.surveyDetails.value!.options[index].optionText,
                                color: primaryBlackColor,
                                fontSize: 18.0,
                              ),
                            ),
                            if (controller.selectedOptionIndex.value == index)
                              SizedBox(width: 10), // Add spacing between option text and vote count
                            if (controller.selectedOptionIndex.value == index)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    // Display vote count for each option
                                    text: 'votes'.tr + '${controller.surveyDetails.value!.options[index].voteCount}',
                                    color: primaryBlackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  CustomText(
                                    // Display percentage of votes for each option
                                    text: '${controller.calculatePercentage(controller.surveyDetails.value!.options[index].voteCount.toString())}%',
                                    color: primaryBlackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Display a loading indicator while data is being fetched
            return Center(
                child: CircularProgressIndicator(
                  color: primaryGreenColor,
                )
            );
          }
        }),
      ),
    );
  }
}
