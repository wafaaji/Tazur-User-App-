import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customJobCard.dart';
import 'package:graduation_project/components/customNoResult.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/model/jobModel.dart';
import 'package:graduation_project/modules/all-jobs/allJobsController.dart';
import 'package:graduation_project/modules/all-jobs/component/allJobsSearchFilter.dart';

class AllJobsScreen extends StatelessWidget {
  AllJobsController controller = Get.put(AllJobsController());
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      body: Column(
              children: [
                AllJobsSearchFilter(),
                SizedBox(
                  height: 25.0,
                ),
              Obx((){
                if (controller.isLoading.value && controller.allJobs.isEmpty && controller.searchJobs.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(color: primaryGreenColor),
                  );
                }
                return Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo is ScrollEndNotification &&
                          scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        if (controller.search.isNotEmpty) {
                          controller.onScrollSearch();
                        } else {
                          controller.onScroll();
                        }
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
                        itemCount: controller.search.isEmpty ? controller.allJobs.length + 1 : controller.searchJobs.length + 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final List<Job> jobs = controller.search.isEmpty ? controller.allJobs : controller.searchJobsList;
                          if (index < jobs.length) {
                            final job = jobs[index];
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
                                child: CircularProgressIndicator(color: primaryGreenColor),
                              );
                            } else if (controller.searchJobs.isEmpty && controller.search.isNotEmpty) {
                              // Show no result message only for search results
                              return CustomNoResult(
                                text: 'no results search'.tr,
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
                );
                }),
            ],
         ),

    );
  }
}
