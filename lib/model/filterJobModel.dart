import 'dart:convert';
import 'package:graduation_project/model/jobModel.dart';
import 'package:graduation_project/model/linkModel.dart';

FilterJobModel filterJobModelFromJson(String str) => FilterJobModel.fromJson(json.decode(str));

String filterJobModelToJson(FilterJobModel data) => json.encode(data.toJson());

class FilterJobModel {
  int? currentPage;
  List<Job>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;
  List<String>? topic;
  List<String>? experience_years;
  List<String>? work_city;

  FilterJobModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
    this.topic,
    this.experience_years,
    this.work_city
  });

  factory FilterJobModel.fromJson(Map<String, dynamic> json) => FilterJobModel(
    currentPage: json["current_page"],
    data: List<Job>.from(json["data"].map((x) => Job.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    'topic' : topic,
    'experience_years' : experience_years,
    'work_city' : work_city,
  };
}
