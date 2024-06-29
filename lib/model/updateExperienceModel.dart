import 'dart:convert';

import 'package:graduation_project/model/experienceModel.dart';

UpdateExperienceModel updateExperienceModelFromJson(String str) => UpdateExperienceModel.fromJson(json.decode(str));

String updateExperienceModelToJson(UpdateExperienceModel data) => json.encode(data.toJson());

class UpdateExperienceModel {
  String? message;
  Experiences? experiences;

  UpdateExperienceModel({
    this.message,
    this.experiences,
  });

  factory UpdateExperienceModel.fromJson(Map<String, dynamic> json) => UpdateExperienceModel(
    message: json["message"],
    experiences: Experiences.fromJson(json["experiences"]),
  );

  Map<String, dynamic> toJson() => {
    "experiences": experiences!.toJson(),
  };

}