import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/customText.dart';
import 'package:graduation_project/components/multi-select-dropdown/customMultiSelectDialog.dart';
import 'package:graduation_project/constants.dart';

abstract class BaseController extends GetxController {

  // Topic
  final RxList<String> _selectedTopicItems = <String>[].obs;
  List<String> get selectedTopicItems => _selectedTopicItems.toList();
  void setSelectedTopicItems(List<String> items) {
    _selectedTopicItems.assignAll(items);
  }
  void showMultiSelectTopic() {
    Get.dialog(
      Obx((){
        return CustomMultiSelectDialog(
          title: 'select topic'.tr,
          widget: SizedBox(
            height: 2.0,
            child: CustomText(
              text: 'you can choose 7 topics'.tr,
              color: primaryBlackColor.withOpacity(0.50),
              fontSize: 15,
            ),
          ),
          applyCondition: true,
          items: topicItems,
          selectedItems: selectedTopicItems,
          // Pass a callback function to handle the result
          onSelect: (List<String> result) {
            _selectedTopicItems.assignAll(result);
          },
        );
      }),
    );
  }
  void addTopicItem(String item) {
    _selectedTopicItems.add(item);
  }
  void removeTopicItem(String item) {
    _selectedTopicItems.remove(item);
  }

  // Topic Filter
  final RxList<String> _selectedTopicFilterItems = <String>[].obs;
  List<String> get selectedTopicFilterItems => _selectedTopicFilterItems.toList();
  void showMultiSelectTopicFilter() {
    Get.dialog(
      Obx((){
        return CustomMultiSelectDialog(
          title: 'select topic'.tr,
          widget: SizedBox(
            height: 2.0,
          ),
          items: topicItems,
          selectedItems: selectedTopicFilterItems,
          // Pass a callback function to handle the result
          onSelect: (List<String> result) {
            _selectedTopicFilterItems.assignAll(result);
          },
        );
      }),
    );
  }
  void addTopicFilterItem(String item) {
    _selectedTopicFilterItems.add(item);
  }
  void removeTopicFilterItem(String item) {
    _selectedTopicFilterItems.remove(item);
  }

  // Job Environment
  final RxList<String> _selectedJobEnvironmentItems = <String>[].obs;
  List<String> get selectedJobEnvironmentItems => _selectedJobEnvironmentItems.toList();
  void setSelectedJobEnvironmentItems(List<String> items) {
    _selectedJobEnvironmentItems.assignAll(items);
  }
  void showMultiSelectJobEnvironment() {
    Get.dialog(
      Obx((){
        return CustomMultiSelectDialog(
          title: 'select job environment'.tr,
          items: jobEnvironmentItems,
          selectedItems: selectedJobEnvironmentItems,
          // Pass a callback function to handle the result
          onSelect: (List<String> result) {
            _selectedJobEnvironmentItems.assignAll(result);
          },
        );
      }),
    );
  }
  void addJobEnvironmentItem(String item) {
    _selectedJobEnvironmentItems.add(item);
    print(selectedJobEnvironmentItems);
  }
  void removeJobEnvironmentItem(String item) {
    _selectedJobEnvironmentItems.remove(item);
    print(selectedJobEnvironmentItems);
  }

  // Job Time
  final RxList<String> _selectedJobTimeItems = <String>[].obs;
  List<String> get selectedJobTimeItems => _selectedJobTimeItems.toList();
  void setSelectedJobTimeItems(List<String> items) {
    _selectedJobTimeItems.assignAll(items);
  }
  void showMultiSelectJobTime() {
    Get.dialog(
      Obx((){
        return CustomMultiSelectDialog(
          title: 'select job time'.tr,
          items: jobTimeItems,
          selectedItems: selectedJobTimeItems,
          // Pass a callback function to handle the result
          onSelect: (List<String> result) {
            _selectedJobTimeItems.assignAll(result);
          },
        );
      }),
    );
  }
  void addJobTimeItem(String item) {
    _selectedJobTimeItems.add(item);
  }
  void removeJobTimeItem(String item) {
    _selectedJobTimeItems.remove(item);
  }

  // Experience Years
  final RxList<String> _selectedExperienceYearsItems = <String>[].obs;
  List<String> get selectedExperienceYearsItems => _selectedExperienceYearsItems.toList();
  void showMultiSelectExperienceYears() {
    Get.dialog(
      Obx((){
        return CustomMultiSelectDialog(
          title: 'select experience years'.tr,
          items: experienceYearsItems,
          selectedItems: selectedExperienceYearsItems,
          // Pass a callback function to handle the result
          onSelect: (List<String> result) {
            _selectedExperienceYearsItems.assignAll(result);
          },
        );
      }),
    );
  }
  void addExperienceYearsItem(String item) {
    _selectedExperienceYearsItems.add(item);
  }
  void removeExperienceYearsItem(String item) {
    _selectedExperienceYearsItems.remove(item);
  }

  // Work City
  final RxList<String> _selectedWorkCityItems = <String>[].obs;
  List<String> get selectedWorkCityItems => _selectedWorkCityItems.toList();
  void setSelectedWorkCityItems(List<String> items) {
    _selectedWorkCityItems.assignAll(items);
  }
  void showMultiSelectWorkCity() {
    Get.dialog(
      Obx((){
        return CustomMultiSelectDialog(
          title: 'select work city'.tr,
          items: governorateItems,
          selectedItems: selectedWorkCityItems,
          // Pass a callback function to handle the result
          onSelect: (List<String> result) {
            _selectedWorkCityItems.assignAll(result);
          },
        );
      }),
    );
  }
  void addWorkCityItem(String item) {
    _selectedWorkCityItems.add(item);
  }
  void removeWorkCityItem(String item) {
    _selectedWorkCityItems.remove(item);
  }

  // Languages
  final RxList<String> _selectedLanguagesItems = <String>[].obs;
  List<String> get selectedLanguagesItems => _selectedLanguagesItems.toList();
  void setSelectedLanguagesItems(List<String> items) {
    _selectedLanguagesItems.assignAll(items);
  }
  void showMultiSelectLanguages() {
    Get.dialog(
      Obx((){
        return CustomMultiSelectDialog(
          title: 'select languages'.tr,
          items: languagesItems,
          selectedItems: selectedLanguagesItems,
          // Pass a callback function to handle the result
          onSelect: (List<String> result) {
            _selectedLanguagesItems.assignAll(result);
          },
        );
      }),
    );
  }
  void addLanguagesItem(String item) {
    _selectedLanguagesItems.add(item);
  }
  void removeLanguagesItem(String item) {
    _selectedLanguagesItems.remove(item);
  }

}
