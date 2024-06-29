import 'dart:convert';
import 'package:graduation_project/model/userModel.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  User? user;
  String? token;
  String? email;
  String? password;

  LoginModel({
    this.message,
    this.user,
    this.token,
    this.email,
    this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user!.toJson(),
    "token": token,
    'email' : email,
    'password' : password,
  };
}
