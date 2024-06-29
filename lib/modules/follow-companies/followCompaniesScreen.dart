import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/CustomNoResult.dart';
import 'package:graduation_project/components/customCompanyCard.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/follow-companies/followCompaniesController.dart';

class FollowCompaniesScreen extends GetView<FollowCompaniesController> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value && controller.followCompanies.isEmpty) {
          return Center(
            child: CircularProgressIndicator(color: primaryGreenColor),
          );
        }
        return RefreshIndicator(
          onRefresh: controller.fetchData,
          color: primaryGreenColor,
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryGreenColor,)
            ),
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification &&
                    scrollController.position.extentAfter == 0) {
                  controller.onScroll();
                }
                return false;
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: controller.followCompanies.length + 1,
                  itemBuilder: (context, index) {
                    if (index < controller.followCompanies.length) {
                      final followCompany = controller.followCompanies[index];
                      return CustomCompanyCard(
                        id: followCompany.id!,
                        imgPath: followCompany.logo!,
                        companyName: followCompany.name!,
                        companyTopic: followCompany.topic!,
                      );
                    } else {
                      if (controller.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(color: primaryGreenColor),
                        );
                      } else if (controller.followCompanies.isEmpty) {
                        return CustomNoResult(
                          text: 'no company available'.tr,
                        );
                      } else {
                        return SizedBox();
                      }
                    }
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}