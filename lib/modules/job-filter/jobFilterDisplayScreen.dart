import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/components/customJobCard.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/job-filter/jobFilterController.dart';
import 'package:graduation_project/components/CustomNoResult.dart';

class JobFilterDisplayScreen extends GetView<JobFilterController> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryWhiteColor,
      appBar: CustomAppBar(
        title: 'filter screen'.tr,
        onPressed: () {
          controller.resetFilter();
          Get.back();
        },
        isArabic: isArabic,
      ),
      body: Obx(
            () {
          print('${controller.filterJobs}');
          if (controller.isLoading.value && controller.filterJobs.isEmpty) {
            return Center(
              child: CircularProgressIndicator(color: primaryGreenColor),
            );
          }
          return Column(
            children: [
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification &&
                        scrollController.position.extentAfter == 0) {
                      controller.onScroll();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: controller.filterJobs.length + 1, // Add 1 for loading indicator or page 2
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < controller.filterJobs.length) {
                        print(controller.filterJobs.length);
                        final job = controller.filterJobs[index];
                        return CustomJobCard(
                          id: job.id,
                          imgPath: job.company.logo,
                          jobTitle: job.jobTitle,
                          createdAt: job.createdAt,
                          topic: job.topic,
                          experienceYears: job.experienseYears,
                          jobTime: job.jobTime,
                          location: job.location,
                          companyName: job.company.name.toString(),
                          companyLocation: job.company.location.toString(),
                          hiddenName: job.hiddenName,
                        );
                      } else {
                        if (controller.filterJobs.isEmpty) {
                          return CustomNoResult(
                            text: 'no results search'.tr,
                            onPressed: () {
                              Get.offNamed('/filter');
                            },
                          );
                        } else if (!controller.isFetching) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: primaryGreenColor,
                              ),
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}