class Course {
  int id;
  DateTime createdAt;
  String duration;
  String numberTrainees;
  String topic;
  String type;
  String name;
  String status;
  int companyId;
  String startDate;
  String endDate;
  int days;
  String price;
  String location;
  Company company;

  Course({
    required this.id,
    required this.createdAt,
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

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    duration: json["duration"],
    numberTrainees: json["number_trainees"],
    topic: json["topic"],
    type: json["type"],
    name: json["name"],
    status: json["status"],
    companyId: json["company_id"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    days: json["days"],
    price: json["price"],
    location: json["location"],
    company: Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "duration": duration,
    "number_trainees": numberTrainees,
    "topic": topic,
    "type": type,
    "name": name,
    "status": status,
    "company_id": companyId,
    "start_date": startDate,
    "end_date": endDate,
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