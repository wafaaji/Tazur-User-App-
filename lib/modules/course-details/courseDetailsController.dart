import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/courseDetailsModel.dart';
import 'package:graduation_project/model/interestedModel.dart';
import 'package:graduation_project/modules/course-details/courseDetailsService.dart';
import 'package:graduation_project/modules/course-details/courseInterestedService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class CourseDetailsController extends GetxController {

  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  final PageController pageController = PageController(initialPage: 0);

  void onPageChanged(int index) {
    _currentIndex.value = index;
  }

  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  // For Course Details API
  SecureStorage storage = SecureStorage();
  // Variable to store the courseId
  RxInt courseId = 0.obs;
  late CourseDetailsService detailsService;
  Rx<CourseDetailsModel?> courseDetails = Rx<CourseDetailsModel?>(null);

  // For Interested API
  late CourseInterestedService service;
  var interestedStatus;
  var message;

  @override
  void onInit() {
    detailsService = CourseDetailsService();
    // For Details
    fetchCourseDetails();

    // For Interested
   service = CourseInterestedService();
    interestedStatus = false;
   message = '';

    processCourseDetails(Get.arguments);
    print('Received course id: $courseId');
    super.onInit();
  }

  //
  void fetchCourseDetails() async {
    try {
      var token = await storage.read("token");
      final details = await detailsService.displayCourseDetails(token!, courseId.value);
      courseDetails.value = details;
    } catch (e) {
      print('Error fetching course details: $e');
    }
  }

  // Example method in the controller that receives arguments
  void processCourseDetails(int courseId) {
    this.courseId.value = courseId;
    print('Received course id: $courseId');
  }

  // For Interested API
  Future<void> interestedOnClick() async{
    InterestedModel interested = InterestedModel(
    );
    print("______________Interested Controller________________");

    var token = await storage.read("token");
    print(token);
    interestedStatus = await service.CourseInterested(token, courseId.value, interested);
    message = service.message;

    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + "\n";
      message = temp;
    }
  }

}