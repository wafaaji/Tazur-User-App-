import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customCourseCard.dart';
import 'package:graduation_project/components/customNoResult.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/model/courseModel.dart';
import 'package:graduation_project/modules/courses/component/coursesSearchFilter.dart';
import 'package:graduation_project/modules/courses/coursesController.dart';

// ignore: must_be_immutable
class CoursesScreen extends StatelessWidget {
  CoursesController controller = Get.put(CoursesController());
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      body: Obx((){
        if (controller.isLoading.value && controller.courses.isEmpty) {
          return Center(
            child: CircularProgressIndicator(color: primaryGreenColor),
          );
        }
        return Column(
          children: [
            CoursesSearchFilter(),
            SizedBox(
              height: 25.0,
            ),
            Expanded(
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
                    itemCount: controller.search.isEmpty ? controller.courses.length + 1 : controller.searchCourse.length + 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final List<Course> courses = controller.search.isEmpty ? controller.courses : controller.searchCourseList;
                      if (index < courses.length) {
                        final course = courses[index];
                        return CustomCourseCard(
                          id: course.id,
                          imgPath: course.company.logo,
                          jobTitle: course.name,
                          createdAt: course.createdAt,
                          topic: course.topic,
                          startDate: course.startDate,
                          days: course.days.toString(),
                          courseLocation: course.location,
                          price: course.price.toString(),
                          companyName: course.company.name,
                          companyLocation: course.company.location,
                        );
                      } else {
                        if (controller.isLoading.value) {
                          // Show loading indicator at the end of list
                          return Center(
                            child: CircularProgressIndicator(color: primaryGreenColor),
                          );
                        } else if (controller.searchCourse.isEmpty && controller.search.isNotEmpty) {
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
            ),
          ],
        );
      }),
    );
  }
}
