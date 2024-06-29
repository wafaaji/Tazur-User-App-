import 'dart:convert';

ResendPinCodeModel resendPinCodeModelFromJson(String str) => ResendPinCodeModel.fromJson(json.decode(str));

String resendPinCodeModelToJson(ResendPinCodeModel data) => json.encode(data.toJson());

class ResendPinCodeModel {
  String? message;
  Verification? verification;
  String? email;

  ResendPinCodeModel({
    this.message,
    this.verification,
    this.email,
  });

  factory ResendPinCodeModel.fromJson(Map<String, dynamic> json) => ResendPinCodeModel(
    message: json["message"],
    verification: Verification.fromJson(json["verification"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "verification": verification!.toJson(),
    'email': email,
  };
}

class Verification {
  int id;
  String email;
  int code;
  int numOfResend;
  DateTime lastResendDate;
  DateTime createdAt;
  DateTime updatedAt;

  Verification({
    required this.id,
    required this.email,
    required this.code,
    required this.numOfResend,
    required this.lastResendDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
    id: json["id"],
    email: json["email"],
    code: json["code"],
    numOfResend: json["num_of_resend"],
    lastResendDate: DateTime.parse(json["last_resend_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "code": code,
    "num_of_resend": numOfResend,
    "last_resend_date": lastResendDate.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
