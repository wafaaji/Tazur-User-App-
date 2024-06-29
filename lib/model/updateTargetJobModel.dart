import 'dart:convert';

UpdateTargetJobModel updateTargetJobModelFromJson(String str) => UpdateTargetJobModel.fromJson(json.decode(str));

String updateTargetJobModelToJson(UpdateTargetJobModel data) => json.encode(data.toJson());

class UpdateTargetJobModel {
  String? message;
  List<String>? jobTime;
  List<String>? jobEnvironment;
  String? jobCurrent;
  List<String>? workCity;
  List<String>? topic;

  UpdateTargetJobModel({
    this.message,
    this.jobTime,
    this.jobEnvironment,
    this.jobCurrent,
    this.workCity,
    this.topic,
  });

  factory UpdateTargetJobModel.fromJson(Map<String, dynamic> json) => UpdateTargetJobModel(
    message: json["message"],
    jobTime: List<String>.from(json["job_time"].map((x) => x)),
    jobEnvironment: List<String>.from(json["job_environment"].map((x) => x)),
    jobCurrent: json["job_current"],
    workCity: List<String>.from(json["work_city"].map((x) => x)),
    topic: List<String>.from(json["topic"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "job_time": List<dynamic>.from(jobTime!.map((x) => x)),
    "job_environment": List<dynamic>.from(jobEnvironment!.map((x) => x)),
    "job_current": jobCurrent,
    "work_city": List<dynamic>.from(workCity!.map((x) => x)),
    "topic": List<dynamic>.from(topic!.map((x) => x)),
  };
}