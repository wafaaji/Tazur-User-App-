import 'package:get/get.dart';
import 'package:graduation_project/model/jobModel.dart';
import 'package:graduation_project/modules/my-jobs/myJobsService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class MyJobsController extends GetxController {
  var isLoading = true.obs;
  SecureStorage storage = SecureStorage();

  // For My Jobs API
  late MyJobsService serviceDisplay;
  var myJobsList = <Job>[].obs;
  late List<Job> myJobs = [];

  // For Pagination
  var page = 1;
  var isFetching = false;

  @override
  void onInit() async{
    serviceDisplay = MyJobsService();
    fetchData(); // Fetch data when the controller is initialized
    super.onInit();
  }

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      var token = await storage.read("token");
      var newJobs = await serviceDisplay.displayMyJobs(token, page);

      if (newJobs != null) {
        myJobs.addAll(newJobs);
        myJobsList.value = myJobs;
        page++; // Increment page number for pagination
      } else {
        // Handle empty response
        print("No new jobs received");
      }
    } catch (e) {
      // Handle error
      print("Error fetching jobs: $e");
    } finally {
      isLoading.value = false;
    }
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

}
