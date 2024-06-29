import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/job-details/component/customJobCardDetails.dart';
import 'package:graduation_project/modules/job-details/jobDetailsController.dart';

class JobDetailsScreenTwo extends GetView<JobDetailsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Basic Requirements
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
                            text: 'basic requirements'.tr,
                            color: primaryGreenColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          // Education
                          CustomJobCardDetails(
                            imgPath: 'assets/icons/job-card-details-icons/education.png',
                            title: 'education'.tr,
                            text: controller.jobDetails.value?.educationLevel ?? 'N/A',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // Gender
                          CustomJobCardDetails(
                            imgPath: 'assets/icons/job-card-details-icons/gender.png',
                            title: 'gender'.tr,
                            text:  controller.jobDetails.value?.gender ?? 'N/A',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // Experience
                          CustomJobCardDetails(
                            imgPath: 'assets/icons/job-card-icons/experience.png',
                            title: 'experience years'.tr,
                            text:  controller.jobDetails.value?.experienseYears ?? 'N/A',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // Language
                          CustomJobCardDetails(
                            imgPath: 'assets/icons/job-card-details-icons/language.png',
                            title: 'language'.tr,
                            text:  controller.jobDetails.value?.requiredLanguages ?? 'N/A',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // Driver License
                          CustomJobCardDetails(
                            imgPath: 'assets/icons/job-card-details-icons/driver license.png',
                            title: 'driver licence'.tr,
                            text: controller.jobDetails.value?.isRequiredLicense == 0 ? 'Required' : 'Not Required',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  // Special Requirement
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
                            text: 'special requirements'.tr,
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
                              text: controller.jobDetails.value?.specialQualifications ?? 'N/A',
                              color: primaryBlackColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  // Required Skills
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
                            text: 'required skills'.tr,
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
                              text: controller.jobDetails.value?.requireQualifications ?? 'N/A',
                              color: primaryBlackColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
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
