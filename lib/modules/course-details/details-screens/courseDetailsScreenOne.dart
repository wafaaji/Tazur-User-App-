import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/modules/course-details/courseDetailsController.dart';
import 'package:graduation_project/modules/job-details/component/customJobCardDetails.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:intl/intl.dart';

class CourseDetailsScreenOne extends GetView<CourseDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        return Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.88,
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
                      text: 'course details'.tr,
                      color: primaryGreenColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    // Topic
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-icons/topic.png',
                      title: 'topic'.tr,
                      text: controller.courseDetails.value?.topic ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Course Name
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/course-card-details-icons/course name.png',
                      title: 'course name'.tr,
                      text: controller.courseDetails.value?.name ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Course Location
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-icons/job location.png',
                      title: 'course location'.tr,
                      text: controller.courseDetails.value?.location ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Type
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/course-card-details-icons/course name.png',
                      title: 'type'.tr,
                      text: controller.courseDetails.value?.type ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Start Date
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/course-card-icons/start date.png',
                      title: 'start date'.tr,
                      text: controller.courseDetails.value?.startDate != null
                          ? DateFormat('yyyy-MM-dd').format(controller.courseDetails.value!.startDate)
                          : 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Price
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/course-card-icons/price.png',
                      title: 'price'.tr,
                      text: controller.courseDetails.value?.price ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Days
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-details-icons/end date.png',
                      title: 'days'.tr,
                      text: controller.courseDetails.value?.days.toString() ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Duration
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/course-card-details-icons/duration.png',
                      title: 'duration'.tr,
                      text: controller.courseDetails.value?.duration ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // End Date
                    CustomJobCardDetails(
                        imgPath: 'assets/icons/job-card-details-icons/end date.png',
                        title: 'end date'.tr,
                        text: controller.courseDetails.value?.endDate != null
                            ? DateFormat('yyyy-MM-dd').format(controller.courseDetails.value!.endDate)
                            : 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
