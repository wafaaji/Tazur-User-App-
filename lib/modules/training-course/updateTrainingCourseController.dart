import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/trainingCourseModel.dart';
import 'package:graduation_project/model/updateTrainingCourseModel.dart';
import 'package:graduation_project/modules/training-course/updateTrainingCourseService.dart';
import 'package:graduation_project/native-services/secureStorage.dart';

class UpdateTrainingCourseController extends GetxController {
  SecureStorage storage = SecureStorage();
  var isLoading = true.obs;
  var trainingCourseId = Get.arguments['trainingCourseId'];
  var message;

  // Update Training Course
  late TextEditingController trainingCourseNameController, sourceController, durationController, trainingCourseDetailsController;
  var trainingCourseName = ''.obs;
  var source = ''.obs;
  var duration = ''.obs;
  var trainingCourseDetails = ''.obs;
  var isPicPathSet = false.obs;
  var picPath = ''.obs;
  late UpdateTrainingCourseService updateTrainingCourseService;
  var updateTrainingCourseStatus = false;

  @override
  void onInit() {
    updateTrainingCourseService = UpdateTrainingCourseService();
    trainingCourseNameController = TextEditingController(text: trainingCourseName.value);
    sourceController = TextEditingController(text: source.value);
    durationController = TextEditingController(text: duration.value);
    trainingCourseDetailsController = TextEditingController(text: trainingCourseDetails.value);

    fetchTrainingCourse();
    print(trainingCourseId);
    super.onInit();
  }

  void fetchTrainingCourse() async {
    isLoading.value = true;
    var token = await storage.read("token");

    var trainingCourseInfo = await updateTrainingCourseService.fetchTrainingCourse(token, trainingCourseId);

    if (trainingCourseInfo != null) {
      var trainingCourseData = trainingCourseInfo['training_course'];
      trainingCourseName.value = trainingCourseData['name'] ?? 'training course name'.tr;
      source.value = trainingCourseData['source'] ?? 'source'.tr;
      duration.value = trainingCourseData['duration'] ?? 'duration'.tr;
      trainingCourseDetails.value = trainingCourseData['details'] ?? 'training course details'.tr;
      picPath.value = trainingCourseData['image'] ?? '';

      trainingCourseNameController.text = trainingCourseName.value;
      sourceController.text = source.value;
      durationController.text = duration.value;
      trainingCourseDetailsController.text = trainingCourseDetails.value;

      isLoading.value = false;
      print('Image:' + picPath.value);
      print('Training Course Name:' + trainingCourseName.value);
      print('Source:' + source.value);
      print('Duration:' + duration.value);
      print('Training Course Details:' + trainingCourseDetails.value);
    }
  }

  // Update Training Course API
  Future<void> UpdateTrainingCourse() async {
    trainingCourseName.value = trainingCourseNameController.text;
    source.value = sourceController.text;
    duration.value = durationController.text;
    trainingCourseDetails.value = trainingCourseDetailsController.text;
    try {
      var token = await storage.read("token");
      UpdateTrainingCourseModel updateTrainingCourse = UpdateTrainingCourseModel(
        trainingCourse: TrainingCourse(
          name: trainingCourseName.value,
          source: source.value,
          duration: duration.value,
          details: trainingCourseDetails.value,
          image: picPath.value,
        ),
      );

      updateTrainingCourseStatus = await updateTrainingCourseService.UpdateTrainingCourse(token, updateTrainingCourse, trainingCourseId);
      message = updateTrainingCourseService.message;

      if (message is List) {
        String temp = '';
        for (String s in message)
          temp += s + "\n";
        message = temp;
      }
    } catch (e) {
      print("Error updating training course: $e");
      message = 'error updating training course: $e'.tr;
    }
  }

}