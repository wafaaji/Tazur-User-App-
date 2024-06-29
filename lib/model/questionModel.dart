import 'dart:convert';

List<QuestionModel> QuestionModelFromJson(String str) => List<QuestionModel>.from(json.decode(str).map((x) => QuestionModel.fromJson(x)));

String QuestionModelToJson(List<QuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel {
  int id;
  int formId;
  String question;
  List<Option> options;

  QuestionModel({
    required this.id,
    required this.formId,
    required this.question,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json["id"] is int ? json["id"] : int.tryParse(json["id"] ?? ""),
    formId: json["form_id"] is int ? json["form_id"] : int.tryParse(json["form_id"] ?? ""),
    question: json["question"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "form_id": formId,
    "question": question,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
  };
}

class Option {
  int id;
  String optionText;
  int questionId;

  Option({
    required this.id,
    required this.optionText,
    required this.questionId,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    optionText: json["option_text"],
    questionId: json["question_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "option_text": optionText,
    "question_id": questionId,
  };
}
