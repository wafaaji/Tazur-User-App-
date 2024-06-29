import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/modules/job-details/component/customJobCardDetails.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/job-details/jobDetailsController.dart';
import 'package:intl/intl.dart';

class JobDetailsScreenOne extends GetView<JobDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
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
                      text: 'job details'.tr,
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
                      text: controller.jobDetails.value?.topic ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Job Location
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-icons/job location.png',
                      title: 'job location'.tr,
                      text: controller.jobDetails.value?.location ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Job Filed
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-details-icons/job field.png',
                      title: 'job field'.tr,
                      text: controller.jobDetails.value?.jobTitle ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Salary
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-details-icons/salary.png',
                      title: 'salary'.tr,
                      text: controller.jobDetails.value?.salaryFields ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Job Time
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-icons/job time.png',
                      title: 'job time'.tr,
                      text: controller.jobDetails.value?.jobTime ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Applicants Number
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-details-icons/applicants number.png',
                      title: 'applicants number'.tr,
                      text: controller.jobDetails.value?.numberEmployees ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Job Environment
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-details-icons/job environment.png',
                      title: 'job environment'.tr,
                      text: controller.jobDetails.value?.jobEnvironment ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Military Service
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-details-icons/military service.png',
                      title: 'military services'.tr,
                      text: controller.jobDetails.value?.isRequiredMilitary.toString() ?? 'N/A',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Image
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-details-icons/image.png',
                      title: 'image'.tr,
                      text: controller.jobDetails.value?.isRequiredImage == 0 ? 'Required' : 'Not Required',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // End Date
                    CustomJobCardDetails(
                      imgPath: 'assets/icons/job-card-details-icons/end date.png',
                      title: 'end date'.tr,
                      text: controller.jobDetails.value?.endDate != null
                          ? DateFormat('yyyy-MM-dd').format(controller.jobDetails.value!.endDate)
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
