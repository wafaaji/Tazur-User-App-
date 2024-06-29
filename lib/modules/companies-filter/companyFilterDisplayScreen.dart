import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/CustomNoResult.dart';
import 'package:graduation_project/components/customCompanyCard.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/companies-filter/companyFilterController.dart';

class CompanyFilterDisplayScreen extends GetView<CompanyFilterController> {

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: secondaryWhiteColor,
      body: Obx(
            () {
          if (controller.isLoading.value && controller.filterCompanies.isEmpty) {
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
                    itemCount: controller.filterCompanies.length + 1, // Add 1 for loading indicator or page 2
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < controller.filterCompanies.length) {
                        final filterCompanies = controller.filterCompanies[index];
                        return CustomCompanyCard(
                          id: filterCompanies.id!,
                          imgPath: filterCompanies.logo!,
                          companyName: filterCompanies.name!,
                          companyTopic: filterCompanies.topic!,
                        );
                      } else {
                        if (controller.filterCompanies.isEmpty) {
                          return CustomNoResult(
                            text: 'no results search'.tr,
                            onPressed: () {
                              Get.offNamed('/filterCompany');
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


