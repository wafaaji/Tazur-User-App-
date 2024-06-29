import 'dart:convert';

SendConsultationModel sendConsultationModelFromJson(String str) => SendConsultationModel.fromJson(json.decode(str));

String sendConsultationModelToJson(SendConsultationModel data) => json.encode(data.toJson());

class SendConsultationModel {
  Consulution consulution;

  SendConsultationModel({
    required this.consulution,
  });

  factory SendConsultationModel.fromJson(Map<String, dynamic> json) => SendConsultationModel(
    consulution: Consulution.fromJson(json["consulution"]),
  );

  Map<String, dynamic> toJson() => {
    "consulution": consulution.toJson(),
  };
}

class Consulution {
  String userMessage;
  int? userId;
  String topic;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Consulution({
    required this.userMessage,
    this.userId,
    required this.topic,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Consulution.fromJson(Map<String, dynamic> json) => Consulution(
    userMessage: json["user_message"],
    userId: json["user_id"],
    topic: json["topic"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_message": userMessage,
    "topic": topic,
  };
}
