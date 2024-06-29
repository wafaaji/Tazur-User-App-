import 'dart:convert';

SurveyDetailsModel surveyDetailsModelFromJson(String str) => SurveyDetailsModel.fromJson(json.decode(str));

String surveyDetailsModelToJson(SurveyDetailsModel data) => json.encode(data.toJson());

class SurveyDetailsModel {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int companyId;
  String title;
  String description;
  Company company;
  List<Option> options;

  SurveyDetailsModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.companyId,
    required this.title,
    required this.description,
    required this.company,
    required this.options,
  });

  factory SurveyDetailsModel.fromJson(Map<String, dynamic> json) => SurveyDetailsModel(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    companyId: json["company_id"],
    title: json["title"],
    description: json["description"],
    company: Company.fromJson(json["company"]),
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "company_id": companyId,
    "title": title,
    "description": description,
    "company": company.toJson(),
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
  };
}

class Company {
  int id;
  String name;
  String logo;
  String location;
  String aboutUs;

  Company({
    required this.id,
    required this.name,
    required this.logo,
    required this.location,
    required this.aboutUs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    location: json["location"],
    aboutUs: json["about_us"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "location": location,
    "about_us": aboutUs,
  };
}

class Option {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int surveyId;
  String optionText;
  int voteCount;

  Option({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.surveyId,
    required this.optionText,
    required this.voteCount,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    surveyId: json["survey_id"],
    optionText: json["option_text"],
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "survey_id": surveyId,
    "option_text": optionText,
    "vote_count": voteCount,
  };
}
