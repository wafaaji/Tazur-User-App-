class Experiences {
  int? userId;
  String? companyName;
  String? jobTitle;
  String? startDate;
  String? endDate;
  String? name;
  String? details;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Experiences({
    this.userId,
    this.companyName,
    this.jobTitle,
    this.startDate,
    this.endDate,
    this.name,
    this.details,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Experiences.fromJson(Map<String, dynamic> json) => Experiences(
    userId: json["user_id"],
    companyName: json["company_name"],
    jobTitle: json["job_title"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    name: json["name"],
    details: json["details"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "job_title": jobTitle,
    "start_date": startDate,
    "end_date": endDate,
    "name": name,
    "details": details,
  };
}