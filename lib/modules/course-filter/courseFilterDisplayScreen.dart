import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/CustomNoResult.dart';
import 'package:graduation_project/components/customAppBar.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/components/customCourseCard.dart';
import 'package:graduation_project/modules/course-filter/courseFilterController.dart';

class CourseFilterDisplayScreen extends GetView<CourseFilterController> {

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final isArabic = Get.locale?.languageCode == 'ar';
    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      resizeToAvoidBottomInset: false,
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
          if (controller.isLoading.value && controller.filterCourses.isEmpty) {
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
                    itemCount: controller.filterCourses.length + 1, // Add 1 for loading indicator or page 2
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < controller.filterCourses.length) {
                        final course = controller.filterCourses[index];
                        return CustomCourseCard(
                          id: course.id,
                          imgPath: 'assets/images/company logo.jpg',
                          jobTitle: course.name,
                          createdAt: course.createdAt,
                          topic: course.topic,
                          startDate: course.startDate.toString(),
                          days: course.days.toString(),
                          courseLocation: course.location,
                          price: course.price.toString(),
                          companyName: course.company.name.toString(),
                          companyLocation: course.company.location.toString(),
                        );
                      } else {
                        if (controller.filterCourses.isEmpty) {
                          return CustomNoResult(
                            text: 'no results search'.tr,
                            onPressed: () {
                              Get.offNamed('/filterCourse');
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


