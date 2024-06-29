import 'dart:convert';

ForgetPasswordNewPasswordModel forgetPasswordNewPasswordModelFromJson(String str) => ForgetPasswordNewPasswordModel.fromJson(json.decode(str));

String forgetPasswordNewPasswordModelToJson(ForgetPasswordNewPasswordModel data) => json.encode(data.toJson());

class ForgetPasswordNewPasswordModel {
  String? message;
  String? email;
  String? password;
  String? password_confirmation;

  ForgetPasswordNewPasswordModel({
    this.message,
    this.email,
    this.password,
    this.password_confirmation,
  });

  factory ForgetPasswordNewPasswordModel.fromJson(Map<String, dynamic> json) => ForgetPasswordNewPasswordModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    'email' : email,
    'password' : password,
    'password_confirmation' : password_confirmation,
  };
}
