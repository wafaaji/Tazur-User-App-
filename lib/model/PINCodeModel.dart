import 'dart:convert';

PINCodeModel PINCodeModelFromJson(String str) => PINCodeModel.fromJson(json.decode(str));

String PINCodeModelToJson(PINCodeModel data) => json.encode(data.toJson());

class PINCodeModel {
  String? message;
  String? email;
  String? code;

  PINCodeModel({
    this.message,
    this.email,
    this.code,
  });

  factory PINCodeModel.fromJson(Map<String, dynamic> json) => PINCodeModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    'email' : email,
    'code' : code,
  };
}
