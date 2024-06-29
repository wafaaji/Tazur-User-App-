import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customCompanyCard.dart';
import 'package:graduation_project/components/customNoResult.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:graduation_project/modules/all-companies/allCompaniesController.dart';
import 'package:graduation_project/modules/all-companies/companoant/allCompainesSearchFilter.dart';

class AllCompaniesScreen extends GetView<AllCompaniesController> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AllCompaniesSearchFilter(),
          SizedBox(
            height: 10.0,
          ),
          Obx((){
            if (controller.isLoading.value && controller.allCompanies.isEmpty && controller.searchCompanies.isEmpty) {
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
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: controller.search.isEmpty ? controller.allCompanies.length + 1 : controller.searchCompanies.length + 1,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                final List<Companies> companies = controller.search.isEmpty ? controller.allCompanies : controller.searchCompanies;
                                if (index < companies.length) {
                                  final company = companies[index];
                                return CustomCompanyCard(
                                  id: company.id!,
                                  imgPath: company.logo!,
                                  companyName: company.name!,
                                  companyTopic: company.topic!,
                                );
                                } else {
                                  if (controller.isLoading.value) {
                                    // Show loading indicator at the end of list
                                    return Center(
                                      child: CircularProgressIndicator(color: primaryGreenColor),
                                    );
                                  } else if (controller.searchCompanies.isEmpty && controller.search.isNotEmpty) {
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
            );
          }),
        ],
      ),
    );
  }
}
