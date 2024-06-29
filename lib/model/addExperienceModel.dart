import 'dart:convert';
import 'package:graduation_project/model/experienceModel.dart';

AddExperienceModel addExperienceModelFromJson(String str) => AddExperienceModel.fromJson(json.decode(str));

String addExperienceModelToJson(AddExperienceModel data) => json.encode(data.toJson());

class AddExperienceModel {
  String? message;
  Experiences? experiences;

  AddExperienceModel({
    this.message,
    this.experiences,
  });

  factory AddExperienceModel.fromJson(Map<String, dynamic> json) => AddExperienceModel(
    message: json["message"],
    experiences: Experiences.fromJson(json["experiences"]),
  );

  Map<String, dynamic> toJson() => {
    "experiences": experiences!.toJson(),
  };
}