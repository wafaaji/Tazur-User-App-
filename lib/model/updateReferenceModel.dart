import 'dart:convert';

import 'package:graduation_project/model/referenceModel.dart';

UpdateReferenceModel updateReferenceModelFromJson(String str) => UpdateReferenceModel.fromJson(json.decode(str));

String updateReferenceModelToJson(UpdateReferenceModel data) => json.encode(data.toJson());

class UpdateReferenceModel {
  String? message;
  Reference? reference;

  UpdateReferenceModel({
    this.message,
    this.reference,
  });

  factory UpdateReferenceModel.fromJson(Map<String, dynamic> json) => UpdateReferenceModel(
    message: json["message"],
    reference: Reference.fromJson(json["reference"]),
  );

  Map<String, dynamic> toJson() => {
    "reference": reference!.toJson(),
  };

}