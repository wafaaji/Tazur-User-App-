import 'dart:convert';

import 'package:graduation_project/model/trainingCourseModel.dart';

AddTrainingCourseModel addTrainingCourseModelFromJson(String str) => AddTrainingCourseModel.fromJson(json.decode(str));

String addTrainingCourseModelToJson(AddTrainingCourseModel data) => json.encode(data.toJson());

class AddTrainingCourseModel {
  String? message;
  TrainingCourse? trainingCourse;

  AddTrainingCourseModel({
    this.message,
    this.trainingCourse,
  });

  factory AddTrainingCourseModel.fromJson(Map<String, dynamic> json) => AddTrainingCourseModel(
    message: json["message"],
    trainingCourse: TrainingCourse.fromJson(json["training_course"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "training_course": trainingCourse!.toJson(),
  };
}