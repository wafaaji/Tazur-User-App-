import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/CustomNoResult.dart';
import 'package:graduation_project/components/customJobCard.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/my-jobs/myJobsController.dart';

class MyJobsScreen extends StatelessWidget {
  MyJobsController controller = Get.put(MyJobsController());

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      body: Obx(
            () {
              if (controller.isLoading.value && controller.myJobs.isEmpty) {
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
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await controller.fetchData();
                      },
                      color: primaryGreenColor,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: controller.myJobs.length + 1,
                        // Add 1 for loading indicator or page 2
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index < controller.myJobs.length) {
                            final job = controller.myJobs[index];
                            return CustomJobCard(
                              id: job.id,
                              imgPath: job.company.logo,
                              jobTitle: job.jobTitle,
                              createdAt: job.createdAt,
                              topic: job.topic,
                              experienceYears: job.experienseYears,
                              jobTime: job.jobTime,
                              location: job.location,
                              companyName: job.company.name,
                              companyLocation: job.company.location,
                              hiddenName: job.hiddenName,
                            );
                          } else {
                            if (controller.isLoading.value) {
                              // Show loading indicator at the end of list
                              return Center(
                                child: Column(
                                  children: [
                                    CircularProgressIndicator(color: primaryGreenColor),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              );
                            } else if (controller.myJobs.isEmpty) {
                              // Show no result message only for search results
                              return CustomNoResult(
                                text: 'no job available'.tr,
                              );
                            } else {
                              // No more data to load
                              return SizedBox();
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}


