import 'dart:convert';
import 'package:graduation_project/model/jobModel.dart';
import 'package:graduation_project/model/linkModel.dart';

SearchJobModel searchJobModelFromJson(String str) => SearchJobModel.fromJson(json.decode(str));

String searchJobModelToJson(SearchJobModel data) => json.encode(data.toJson());

class SearchJobModel {
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
  String? value;

  SearchJobModel({
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
    this.value,
  });

  factory SearchJobModel.fromJson(Map<String, dynamic> json) => SearchJobModel(
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
    'value' : value,
  };
}
