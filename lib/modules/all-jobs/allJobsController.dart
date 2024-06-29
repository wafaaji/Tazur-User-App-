import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/model/jobModel.dart';
import 'package:graduation_project/model/searchJobModel.dart';
import 'package:graduation_project/modules/all-jobs/allJobsService.dart';
import 'package:graduation_project/modules/all-jobs/searchJobService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class AllJobsController extends BaseController {
  late TextEditingController searchController;
  var search = '';
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  // For All Jobs API
  late AllJobsService serviceDisplay;
  var allJobsList = <Job>[].obs;
  late List<Job> allJobs = [];

  // For Search Jobs API
  late SearchJobsService serviceSearchDisplay;
  var searchJobsList = <Job>[].obs;
  late List<Job> searchJobs = [];

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
    // All Jobs
    serviceDisplay = AllJobsService();
    fetchData(); // Fetch data when the controller is initialized

    // Search Jobs
    serviceSearchDisplay = SearchJobsService();
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

  // For All Jobs API
  Future<void> fetchData() async {
    isLoading.value = true;

    var token = await storage.read("token");
    print(token);
    var newJobs = await serviceDisplay.displayAllJobs(token,page);
    allJobs.addAll(newJobs);
    allJobsList.value = allJobs;

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

  // For Search Jobs API
  Future<void> fetchSearchData() async {
    search = searchController.text;
    isLoading.value = true;
    SearchJobModel searchJobModel = SearchJobModel (
      value: search
    );

    var token = await storage.read("token");
    print(token);
    var newJobs = await serviceSearchDisplay.displaySearchJobs(token, searchJobModel ,searchPage);
    searchJobs.addAll(newJobs);
    searchJobsList.value = searchJobs;

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  void resetSearch() {
    searchController.clear(); // Clear the search text field
    search = ''; // Reset the search query
    searchJobsList.clear(); // Clear the search results list
    searchPage = 1; // Reset the search page back to the first page
    fetchSearchData(); // Fetch new search results
  }

}