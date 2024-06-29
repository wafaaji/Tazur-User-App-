import 'dart:convert';

ApplyModel ApplyModelFromJson(String str) => ApplyModel.fromJson(json.decode(str));

String ApplyModelToJson(ApplyModel data) => json.encode(data.toJson());

class ApplyModel {
  String? message;
  List<Question>? questions;

  ApplyModel({
    this.message,
    this.questions,
  });

  factory ApplyModel.fromJson(Map<String, dynamic> json) => ApplyModel(
    message: json["message"],
    questions: json["questions"] != null
        ? List<Question>.from(
        json["questions"].map((x) => Question.fromJson(x)))
        : null,
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "questions": questions != null
        ? List<dynamic>.from(questions!.map((x) => x.toJson()))
        : null,
  };
}

class Question {
  int id;
  int answerId;

  Question({
    required this.id,
    required this.answerId,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    answerId: json["answer_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "answer_id": answerId,
  };
}
