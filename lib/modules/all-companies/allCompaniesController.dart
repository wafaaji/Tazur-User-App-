import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:graduation_project/model/searchCompanyModel.dart';
import 'package:graduation_project/modules/all-companies/allCompaniesService.dart';
import 'package:graduation_project/modules/all-companies/searchCompaniesService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class AllCompaniesController extends GetxController {
  late TextEditingController searchController;
  var search = '';
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  // For All Companies API
  late AllCompaniesService serviceDisplay;
  var allCompaniesList = <Companies>[].obs;
  late List<Companies> allCompanies = [];

  // For Search Companies API
  late SearchCompaniesService serviceSearchDisplay;
  var searchCompaniesList = <Companies>[].obs;
  late List<Companies> searchCompanies = [];

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
    // All Companies
    serviceDisplay = AllCompaniesService();
    fetchData(); // Fetch data when the controller is initialized

    // Search Jobs
    serviceSearchDisplay = SearchCompaniesService();
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
    var newCompanies = await serviceDisplay.displayAllCompanies(token,page);
    allCompanies.addAll(newCompanies);
    allCompaniesList.value = allCompanies;

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
    SearchCompanyModel searchCompanyModel = SearchCompanyModel (
        value: search
    );

    var token = await storage.read("token");
    print(token);
    var newCompanies = await serviceSearchDisplay.displaySearchCompanies(token, searchCompanyModel ,searchPage);
    searchCompanies.addAll(newCompanies);
    searchCompaniesList.value = searchCompanies;

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  void resetSearch() {
    searchController.clear(); // Clear the search text field
    search = ''; // Reset the search query
    searchCompaniesList.clear(); // Clear the search results list
    searchPage = 1; // Reset the search page back to the first page
    fetchSearchData(); // Fetch new search results
  }

}