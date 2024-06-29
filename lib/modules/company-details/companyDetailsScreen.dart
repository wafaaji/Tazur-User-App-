import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customCourseCard.dart';
import 'package:graduation_project/components/customEasyLoading.dart';
import 'package:graduation_project/components/customElevatedButton.dart';
import 'package:graduation_project/components/customJobCard.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/company-details/companyDetailsController.dart';
import 'package:graduation_project/modules/company-details/component/TabButton.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final CompanyDetailsController controller = Get.put(CompanyDetailsController());

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: primaryGreenColor,
            ),
          );
        } else if (controller.companyDetails.value == null) {
          return Center(
            child: Text('Error loading company details.'),
          );
        } else {
          final companyDetails = controller.companyDetails.value!.the0;
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        companyDetails.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: kToolbarHeight,
                      left: isArabic ? null : 10,
                      right: isArabic ? 10 : null,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Get.back();
                        },
                        color: primaryWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx((){
                      return CustomElevatedButton(
                        onPressed: () {
                          // Follow/Unfollow logic
                          if (controller.companyDetails.value!.isFollowed) {
                            onClickFollowUnfollow();
                          } else {
                            onClickFollowUnfollow();
                          }
                        },
                        backgroundColor: controller.companyDetails.value!.isFollowed
                            ? primaryWhiteColor
                            : primaryGreenColor,
                        textColor: controller.companyDetails.value!.isFollowed
                            ? primaryGreenColor
                            : primaryWhiteColor,
                        borderColor: primaryGreenColor,
                        text: controller.companyDetails.value!.isFollowed
                            ? 'unfollow button'.tr
                            : 'follow button'.tr,
                      );
                    }),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: companyDetails.name,
                            color: primaryBlackColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CustomText(
                            text: companyDetails.location,
                            color: primaryBlackColor.withOpacity(0.50),
                            fontSize: 16.0,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                          CustomText(
                            text: companyDetails.topic,
                            color: primaryBlackColor.withOpacity(0.50),
                            fontSize: 16.0,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                color: primaryWhiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => TabButton(
                      text: 'jobs'.tr,
                      onPressed: () => controller.selectTab(0),
                      isSelected: controller.selectedIndex.value == 0,
                    )),
                    Obx(() => TabButton(
                      text: 'courses'.tr,
                      onPressed: () => controller.selectTab(1),
                      isSelected: controller.selectedIndex.value == 1,
                    )),
                    Obx(() => TabButton(
                      text: 'about company'.tr,
                      onPressed: () => controller.selectTab(2),
                      isSelected: controller.selectedIndex.value == 2,
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  switch (controller.selectedIndex.value) {
                    case 0:
                      return companyDetails.jobs.isNotEmpty
                          ? ListView.builder(
                        itemCount: companyDetails.jobs.length,
                        itemBuilder: (context, index) {
                          final job = companyDetails.jobs[index];
                          return CustomJobCard(
                            id: job.id,
                            imgPath: companyDetails.logo,
                            jobTitle: job.jobTitle,
                            createdAt: job.createdAt,
                            topic: job.topic,
                            experienceYears: job.experienseYears,
                            jobTime: job.jobTime,
                            location: job.location,
                            companyName: companyDetails.name,
                            companyLocation: companyDetails.location,
                            hiddenName: job.hiddenName,
                          );
                        },
                      )
                          : Center(
                        child: Text('No jobs available.'),
                      );
                    case 1:
                      return companyDetails.courses.isNotEmpty
                          ? ListView.builder(
                        itemCount: companyDetails.courses.length,
                        itemBuilder: (context, index) {
                          final course = companyDetails.courses[index];
                          return CustomCourseCard(
                            id: course.id,
                            imgPath: companyDetails.logo,
                            jobTitle: course.name,
                            createdAt: course.createdAt,
                            topic: course.topic,
                            companyName: companyDetails.name,
                            companyLocation: companyDetails.location,
                            startDate: course.startDate.toString(),
                            days: course.days.toString(),
                            courseLocation: course.location,
                            price: course.price.toString(),
                          );
                        },
                      )
                          : Center(
                        child: Text('No courses available.'),
                      );
                    case 2:
                      return Container(
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
                              SizedBox(height: 20.0),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: secondaryWhiteColor,
                                ),
                                child: CustomText(
                                  text: companyDetails.aboutUs,
                                  color: primaryBlackColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    default:
                      return SizedBox();
                  }
                }),
              ),
            ],
          );
        }
      }),
    );
  }

  // For Follow Unfollow Button
  void onClickFollowUnfollow() async {
    CustomEasyLoading.showLoading();

    // Await the completion of applyOnClick method
    await controller.followUnfollowOnClick();

    // Dismiss loading indicator
    CustomEasyLoading.dismiss();

    if (controller.followUnfollowStatus) {
      CustomEasyLoading.showSuccess(controller.message);
    } else {
      CustomEasyLoading.showError(controller.message);
      print("Error Here");
    }
  }

}
