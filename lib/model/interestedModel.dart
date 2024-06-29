import 'dart:convert';

InterestedModel InterestedModelFromJson(String str) => InterestedModel.fromJson(json.decode(str));

String InterestedModelToJson(InterestedModel data) => json.encode(data.toJson());

class InterestedModel {
  String? message;

  InterestedModel({
    this.message,
  });

  factory InterestedModel.fromJson(Map<String, dynamic> json) => InterestedModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
