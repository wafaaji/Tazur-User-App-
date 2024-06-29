import 'package:get/get.dart';
import 'package:graduation_project/components/multi-select-dropdown/BaseController.dart';
import 'package:graduation_project/model/CourseModel.dart';
import 'package:graduation_project/model/filterCourseModel.dart';
import 'package:graduation_project/modules/course-filter/courseFilterService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class CourseFilterController extends BaseController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;

  //for display Filter Courses
  late FilterCoursesService serviceFilterDisplay;
  var filterCoursesList = <Course>[].obs;
  late List<Course> filterCourses= [];

  // For Pagination
  var filterPage = 1;
  var isFetching = false;

  @override
  void onInit() async{
    // For Filter
    serviceFilterDisplay = FilterCoursesService();

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
    FilterCourseModel filterCourseModel = FilterCourseModel (
      topic: selectedTopicFilterItems,
      work_city: selectedWorkCityItems,
    );

    var token = await storage.read("token");
    print(token);
    var newCourses = await serviceFilterDisplay.displayFilterCourses(token, filterCourseModel ,filterPage);
    filterCourses.addAll(newCourses);
    filterCoursesList.value = filterCourses;

    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  void resetFilter() {
    filterCoursesList.clear(); // Clear the search results list
    filterPage = 1; // Reset the search page back to the first page
    filterCourses = []; // Clear the filterCourses list
  }


}