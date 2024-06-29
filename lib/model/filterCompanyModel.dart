import 'dart:convert';
import 'package:graduation_project/model/companiesModel.dart';
import 'package:graduation_project/model/linkModel.dart';

FilterCompanyModel FilterCompanyModelFromJson(String str) => FilterCompanyModel.fromJson(json.decode(str));

String FilterCompanyModelToJson(FilterCompanyModel data) => json.encode(data.toJson());

class FilterCompanyModel {
  int? currentPage;
  List<Companies>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;
  List<String>? topic;
  List<String>? work_city;

  FilterCompanyModel({
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
    this.work_city,
  });

  factory FilterCompanyModel.fromJson(Map<String, dynamic> json) => FilterCompanyModel(
    currentPage: json["current_page"],
    data: List<Companies>.from(json["data"].map((x) => Companies.fromJson(x))),
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
    'work_city' : work_city,
  };
}
