import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/constants.dart';

class CompaniesController extends GetxController with SingleGetTickerProviderMixin{
  late TabController companiesController;

  final List<Tab> companiesTabs = <Tab>[
    Tab(
      child: CustomText(
        text: 'follow companies'.tr,
        color: primaryWhiteColor,
        fontSize: 16,
      ),
    ),
    Tab(
      child: CustomText(
        text: 'all companies'.tr,
        color: primaryWhiteColor,
        fontSize: 18,
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    companiesController = TabController(length: companiesTabs.length, vsync: this);
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose() {
    companiesController.dispose();
    super.onClose();
  }
}
