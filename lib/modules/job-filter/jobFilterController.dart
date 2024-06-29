import 'package:get/get.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/model/filterJobModel.dart';
import 'package:graduation_project/model/jobModel.dart';
import 'package:graduation_project/modules/job-filter/jobFilterJobService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class JobFilterController extends BaseController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  //for display Filter Jobs
  late FilterJobsService serviceFilterDisplay;
  var filterJobsList = <Job>[].obs;
  late List<Job> filterJobs = [];

  // For Pagination
  var filterPage = 1;
  var isFetching = false;

  @override
  void onInit() async {
    // For Filter
    serviceFilterDisplay = FilterJobsService();
    var token = await storage.read("token");
    print(token);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    resetFilter();
  }

  void onScroll() {
    if (!isFetching) {
      isFetching = true;
      filterPage++;
      fetchFilterData().then((_) {
        isFetching = false;
      });
    }
  }

  // For Filter API
  Future<void> fetchFilterData() async {
    isLoading.value = true;
    FilterJobModel filterJobModel = FilterJobModel(
      topic: selectedTopicFilterItems,
      experience_years: selectedExperienceYearsItems,
      work_city: selectedWorkCityItems,
    );

    var token = await storage.read("token");
    print(token);
    var newJobs = await serviceFilterDisplay.displayFilterJobs(token, filterJobModel, filterPage);
    filterJobs.addAll(newJobs);
    filterJobsList.value = filterJobs;

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  void resetFilter() {
    filterJobsList.clear(); // Clear the search results list
    filterPage = 1; // Reset the search page back to the first page
    filterJobs = []; // Clear the filterJobs list
  }
}
