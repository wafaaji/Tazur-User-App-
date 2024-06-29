import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customIconButton.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/modules/all-companies/allCompaniesScreen.dart';
import 'package:graduation_project/modules/companies/companiesController.dart';
import 'package:graduation_project/modules/follow-companies/followCompaniesScreen.dart';

class CompaniesScreen extends GetView<CompaniesController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreenColor,
        leading: CustomIconButton(
          onPressed: (){
            Get.toNamed('/home');
          },
          icon: Icons.arrow_back_outlined,
          color: primaryWhiteColor,
        ),
        bottom: TabBar(
          //isScrollable: true,
          indicatorColor: primaryWhiteColor,
          indicatorWeight: 4.0,
          unselectedLabelColor: primaryBlackColor,
          controller: controller.companiesController,
          tabs: controller.companiesTabs,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.companiesController,
              children: [
                FollowCompaniesScreen(),
                AllCompaniesScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
