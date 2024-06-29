import 'dart:convert';

import 'package:graduation_project/model/referenceModel.dart';

AddReferenceModel addReferenceModelFromJson(String str) => AddReferenceModel.fromJson(json.decode(str));

String addReferenceModelToJson(AddReferenceModel data) => json.encode(data.toJson());

class AddReferenceModel {
  String? message;
  Reference? reference;

  AddReferenceModel({
    this.message,
    this.reference,
  });

  factory AddReferenceModel.fromJson(Map<String, dynamic> json) => AddReferenceModel(
    message: json["message"],
    reference: Reference.fromJson(json["reference"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "reference": reference!.toJson(),
  };
}