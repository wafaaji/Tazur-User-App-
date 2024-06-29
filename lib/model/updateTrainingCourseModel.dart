import 'dart:convert';

import 'package:graduation_project/model/trainingCourseModel.dart';

UpdateTrainingCourseModel updateTrainingCourseModelFromJson(String str) => UpdateTrainingCourseModel.fromJson(json.decode(str));

String updateTrainingCourseModelToJson(UpdateTrainingCourseModel data) => json.encode(data.toJson());

class UpdateTrainingCourseModel {
  String? message;
  TrainingCourse? trainingCourse;

  UpdateTrainingCourseModel({
    this.message,
    this.trainingCourse,
  });

  factory UpdateTrainingCourseModel.fromJson(Map<String, dynamic> json) => UpdateTrainingCourseModel(
    message: json["message"],
    trainingCourse: TrainingCourse.fromJson(json["training_course"]),
  );

  Map<String, dynamic> toJson() => {
    "training_course": trainingCourse!.toJson(),
  };

}