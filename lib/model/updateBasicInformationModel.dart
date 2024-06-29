import 'dart:convert';

UpdateBasicInformationModel updateBasicInformationModelFromJson(String str) => UpdateBasicInformationModel.fromJson(json.decode(str));

String updateBasicInformationModelToJson(UpdateBasicInformationModel data) => json.encode(data.toJson());

class UpdateBasicInformationModel {
  String? message;
  bool? drivingLicense;
  String? militaryStatus;
  String? education;
  String? experienceYears;
  DateTime? birthday;
  String? gender;

  UpdateBasicInformationModel({
    this.message,
    this.drivingLicense,
    this.militaryStatus,
    this.education,
    this.experienceYears,
    this.birthday,
    this.gender,
  });

  factory UpdateBasicInformationModel.fromJson(Map<String, dynamic> json) => UpdateBasicInformationModel(
    message: json["message"],
    drivingLicense: json["driving_license"] == 1 ? true : false,
    militaryStatus: json["military_status"],
    education: json["education"],
    experienceYears: json["experience_years"],
    birthday: json["birthday"] != null ? DateTime.parse(json["birthday"]) : null,
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "driving_license": drivingLicense == true ? 1 : 0,
    "military_status": militaryStatus,
    "education": education,
    "experience_years": experienceYears,
    "birthday": birthday?.toIso8601String(),
    "gender": gender,
  };
}
