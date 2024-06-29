import 'dart:convert';
import 'package:graduation_project/model/userModel.dart';

AddInformationModel addInformationModelFromJson(String str) => AddInformationModel.fromJson(json.decode(str));

String addInformationModelToJson(AddInformationModel data) => json.encode(data.toJson());

class AddInformationModel {
  String? message;
  User? user;
  String? first_name;
  String? last_name;
  String? governorate;
  String? address;
  String? marital_status;
  String? nationality;
  String? experience_years;
  String? education;
  String? gender;
  bool? driving_license;
  String? military_status;
  List<String>? topic;
  List<String>? job_environment;
  List<String>? job_time;
  List<String>? work_city;
  String? job_current;
  DateTime? birthday;

  AddInformationModel({
    this.message,
    this.user,
    this.first_name,
    this.last_name,
    this.governorate,
    this.address,
    this.marital_status,
    this.nationality,
    this.experience_years,
    this.education,
    this.gender,
    this.driving_license,
    this.military_status,
    this.topic,
    this.job_environment,
    this.job_time,
    this.work_city,
    this.job_current,
    this.birthday,
  });

  factory AddInformationModel.fromJson(Map<String, dynamic> json) {
    return AddInformationModel(
      message: json["message"],
      user: User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "user": user?.toJson(),
      'first_name' : first_name,
      'last_name' : last_name,
      'governorate' : governorate,
      'address' : address,
      'marital_status' : marital_status,
      'nationality' : nationality,
      'experience_years' : experience_years,
      'education' : education,
      'gender' : gender,
      'driving_license' : driving_license,
      'military_status' : military_status,
      'topic' : topic,
      'job_environment' : job_environment,
      'job_time' : job_time,
      'work_city' : work_city,
      'job_current' : job_current,
      'birthday' : birthday?.toIso8601String(),
    };
  }

}


