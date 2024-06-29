import 'dart:convert';

import 'package:graduation_project/model/experienceModel.dart';
import 'package:graduation_project/model/referenceModel.dart';
import 'package:graduation_project/model/userLinkModel.dart';
import 'package:graduation_project/model/trainingCourseModel.dart';

UpdateCvInformationModel updateCvInformationModelFromJson(String str) => UpdateCvInformationModel.fromJson(json.decode(str));

String updateCvInformationModelToJson(UpdateCvInformationModel data) => json.encode(data.toJson());

class UpdateCvInformationModel {
  String? message;
  List<Experiences>? experiences;
  List<TrainingCourse>? traningCourse;
  List<Reference>? references;
  List<Link>? links;
  List<String>? languages;
  String? skills;
  String? jobField;

  UpdateCvInformationModel({
    this.message,
    this.experiences,
    this.traningCourse,
    this.references,
    this.links,
    this.languages,
    this.skills,
    this.jobField,
  });

  factory UpdateCvInformationModel.fromJson(Map<String, dynamic> json) => UpdateCvInformationModel(
    message: json["message"],
    experiences: List<Experiences>.from(json["experiences"].map((x) => Experiences.fromJson(x))),
    traningCourse: List<TrainingCourse>.from(json["traning_course"].map((x) => TrainingCourse.fromJson(x))),
    references: List<Reference>.from(json["references"].map((x) => Reference.fromJson(x))),
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    languages: json["languages"],
    skills: json["skills"],
    jobField: json["job_field"],
  );

  Map<String, dynamic> toJson() => {
    "languages": languages,
    "skills": skills,
    "job_field": jobField,
  };
}
