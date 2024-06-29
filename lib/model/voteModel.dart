import 'dart:convert';

VoteModel voteModelFromJson(String str) => VoteModel.fromJson(json.decode(str));

String voteModelToJson(VoteModel data) => json.encode(data.toJson());

class VoteModel {
  String? message;
  Vote? vote;
  int? option_id;

  VoteModel({
    this.message,
    this.vote,
    this.option_id
  });

  factory VoteModel.fromJson(Map<String, dynamic> json) => VoteModel(
    message: json["message"],
    vote: Vote.fromJson(json["vote"]),
  );

  Map<String, dynamic> toJson() => {
    'option_id' : option_id,
  };
}

class Vote {
  int userId;
  String optionId;
  String surveyId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  int voteCount;

  Vote({
    required this.userId,
    required this.optionId,
    required this.surveyId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.voteCount,
  });

  factory Vote.fromJson(Map<String, dynamic> json) => Vote(
    userId: json["user_id"],
    optionId: json["option_id"],
    surveyId: json["survey_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "option_id": optionId,
    "survey_id": surveyId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "vote_count": voteCount,
  };
}
