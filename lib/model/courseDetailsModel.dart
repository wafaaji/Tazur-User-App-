import 'dart:convert';

CourseDetailsModel courseDetailsModelFromJson(String str) => CourseDetailsModel.fromJson(json.decode(str));

String courseDetailsModelToJson(CourseDetailsModel data) => json.encode(data.toJson());

class CourseDetailsModel {
  int id;
  String duration;
  String numberTrainees;
  String topic;
  String type;
  String name;
  String status;
  int companyId;
  DateTime startDate;
  DateTime endDate;
  int days;
  String price;
  String location;
  Company company;

  CourseDetailsModel({
    required this.id,
    required this.duration,
    required this.numberTrainees,
    required this.topic,
    required this.type,
    required this.name,
    required this.status,
    required this.companyId,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.price,
    required this.location,
    required this.company,
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) => CourseDetailsModel(
    id: json["id"],
    duration: json["duration"],
    numberTrainees: json["number_trainees"],
    topic: json["topic"],
    type: json["type"],
    name: json["name"],
    status: json["status"],
    companyId: json["company_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    days: json["days"],
    price: json["price"],
    location: json["location"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "duration": duration,
    "number_trainees": numberTrainees,
    "topic": topic,
    "type": type,
    "name": name,
    "status": status,
    "company_id": companyId,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "days": days,
    "price": price,
    "location": location,
    "company": company.toJson(),
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
