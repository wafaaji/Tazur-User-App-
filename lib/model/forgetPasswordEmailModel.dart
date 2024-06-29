import 'dart:convert';

ForgetPasswordEmailModel forgetPasswordEmailModelFromJson(String str) => ForgetPasswordEmailModel.fromJson(json.decode(str));

String forgetPasswordEmailModelToJson(ForgetPasswordEmailModel data) => json.encode(data.toJson());

class ForgetPasswordEmailModel {
  String? message;
  String? email;

  ForgetPasswordEmailModel({
    this.message,
    this.email,
  });

  factory ForgetPasswordEmailModel.fromJson(Map<String, dynamic> json) => ForgetPasswordEmailModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    'email' : email,
  };
}
