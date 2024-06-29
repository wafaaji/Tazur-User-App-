import 'dart:convert';

import 'package:graduation_project/model/userModel.dart';
import 'package:graduation_project/model/verificationModel.dart';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? message;
  List<User>? user;
  Verfication? verfication;
  String? token;
  String? email;
  String? phone;
  String? password;
  String? password_confirmation;

  RegisterModel({
    this.message,
    this.user,
    this.verfication,
    this.token,
    this.email,
    this.phone,
    this.password,
    this.password_confirmation,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    message: json["message"],
    user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    verfication: Verfication.fromJson(json["verfication"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": List<dynamic>.from(user!.map((x) => x.toJson())),
    "verfication": verfication?.toJson(),
    "token": token,
    'email' : email,
    'phone' : phone,
    'password' : password,
    'password_confirmation' : password_confirmation,
  };
}
