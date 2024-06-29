import 'dart:convert';

FollowUnfollowCompanyModel FollowUnfollowCompanyModelFromJson(String str) => FollowUnfollowCompanyModel.fromJson(json.decode(str));

String FollowUnfollowCompanyModelToJson(FollowUnfollowCompanyModel data) => json.encode(data.toJson());

class FollowUnfollowCompanyModel {
  String? message;

  FollowUnfollowCompanyModel({
    this.message,
  });

  factory FollowUnfollowCompanyModel.fromJson(Map<String, dynamic> json) => FollowUnfollowCompanyModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
