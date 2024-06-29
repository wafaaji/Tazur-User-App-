import 'dart:convert';

import 'package:graduation_project/model/referenceModel.dart';
import 'package:graduation_project/model/userLinkModel.dart';

UpdateLinkModel updateLinkModelFromJson(String str) => UpdateLinkModel.fromJson(json.decode(str));

String updateLinkModelToJson(UpdateLinkModel data) => json.encode(data.toJson());

class UpdateLinkModel {
  String? message;
  Link? link;

  UpdateLinkModel({
    this.message,
    this.link,
  });

  factory UpdateLinkModel.fromJson(Map<String, dynamic> json) => UpdateLinkModel(
    message: json["message"],
    link: Link.fromJson(json["link"]),
  );

  Map<String, dynamic> toJson() => {
    "link": link!.toJson(),
  };

}
