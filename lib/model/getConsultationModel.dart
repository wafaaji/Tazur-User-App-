import 'dart:convert';

GetConsultationModel getConsultationModelFromJson(String str) => GetConsultationModel.fromJson(json.decode(str));

String getConsultationModelToJson(GetConsultationModel data) => json.encode(data.toJson());

class GetConsultationModel {
  List<UserConsultation>? userConsultation;
  String topic;

  GetConsultationModel({
    this.userConsultation,
    required this.topic,
  });

  factory GetConsultationModel.fromJson(Map<String, dynamic> json) => GetConsultationModel(
    userConsultation: List<UserConsultation>.from(json["user_consultation"].map((x) => UserConsultation.fromJson(x))),
    topic: json["topic"],
  );

  Map<String, dynamic> toJson() => {
    "topic": topic,
  };
}

class UserConsultation {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? advisorId;
  String? userMessage;
  String? advisorReply;
  String topic;

  UserConsultation({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.advisorId,
    this.userMessage,
    this.advisorReply,
    required this.topic,
  });

  factory UserConsultation.fromJson(Map<String, dynamic> json) => UserConsultation(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userId: json["user_id"],
    advisorId: json["advisor_id"],
    userMessage: json["user_message"],
    advisorReply: json["advisor_reply"],
    topic: json["topic"],
  );

  Map<String, dynamic> toJson() => {
    "topic": topic,
  };
}
