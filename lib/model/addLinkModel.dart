import 'dart:convert';

import 'package:graduation_project/model/userLinkModel.dart';

AddLinkModel addLinkModelFromJson(String str) => AddLinkModel.fromJson(json.decode(str));

String addLinkModelToJson(AddLinkModel data) => json.encode(data.toJson());

class AddLinkModel {
  String? message;
  Link? link;

  AddLinkModel({
    this.message,
    this.link,
  });

  factory AddLinkModel.fromJson(Map<String, dynamic> json) => AddLinkModel(
    message: json["message"],
    link: Link.fromJson(json["link"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "link": link!.toJson(),
  };
}