import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customCircleAvatar.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/course-details/courseDetailsController.dart';

class CourseDetailsScreenTwo extends GetView<CourseDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx((){
          return Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCircleAvatar(
                        imagePath: 'assets/images/company logo.jpg',
                        radius: 40.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            CustomText(
                              text: controller.courseDetails.value?.company.name ?? 'N/A',
                              color: primaryBlackColor,
                              fontSize: 20.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            CustomText(
                              text: controller.courseDetails.value?.company.location ?? 'N/A',
                              color: primaryBlackColor,
                              fontSize: 18.0,
                              overflow: TextOverflow.ellipsis, // Add this line
                              maxLines: 1, // Add this line
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.82,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: primaryBlackColor,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'about company'.tr,
                            color: primaryGreenColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondaryWhiteColor,
                            ),
                            child: CustomText(
                              text: controller.courseDetails.value?.company.aboutUs ?? 'N/A',
                              color: primaryBlackColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
