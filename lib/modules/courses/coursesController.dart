import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/model/courseModel.dart';
import 'package:graduation_project/model/searchCourseModel.dart';
import 'package:graduation_project/modules/courses/coursesService.dart';
import 'package:graduation_project/modules/courses/searchCourseService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class CoursesController extends BaseController {
  late TextEditingController searchController;
  var search = '';
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  // For Courses API
  late CoursesService serviceDisplay;
  var coursesList = <Course>[].obs;
  late List<Course> courses = [];

  // For Search Course API
  late SearchCourseService serviceSearchDisplay;
  var searchCourseList = <Course>[].obs;
  late List<Course> searchCourse = [];

  // For Pagination
  var page = 1;
  var searchPage = 1;
  var isFetching = false;

  @override
  void onInit() async{
    searchController = TextEditingController();

    var token = await storage.read("token");
    print(token);
    super.onInit();
  }

  @override
  void onReady() {
    // Courses
    serviceDisplay = CoursesService();
    fetchData(); // Fetch data when the controller is initialized

    // Search
    serviceSearchDisplay = SearchCourseService();
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void onScroll() {
    if (!isFetching) {
      isFetching = true;
      page++;
      fetchData().then((_) {
        isFetching = false;
      });
    }
  }

  // For Courses API
  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    print(token);
    var newCourses = await serviceDisplay.displayCourses(token,page);
    courses.addAll(newCourses);
    coursesList.value = courses;

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  void onScrollSearch() {
    if (!isFetching) {
      isFetching = true;
      searchPage++;
      fetchSearchData().then((_) {
        isFetching = false;
      });
    }
  }

  // For Search Course API
  Future<void> fetchSearchData() async {
    search = searchController.text;
    isLoading.value = true;
    SearchCourseModel searchCourseModel = SearchCourseModel (
        value: search,
    );

    var token = await storage.read("token");
    print(token);
    var newCourse = await serviceSearchDisplay.displaySearchCourse(token, searchCourseModel ,searchPage);
    searchCourse.addAll(newCourse);
    searchCourseList.value = searchCourse;

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  void resetSearch() {
    searchController.clear(); // Clear the search text field
    search = ''; // Reset the search query
    searchCourseList.value = <Course>[]; // Clear the search results list
    searchPage = 1;
    fetchData(); // Reload all Courses
  }

}