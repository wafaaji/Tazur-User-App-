import 'package:graduation_project/model/companyModel.dart';

class Job {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool hiddenName;
  String jobTitle;
  String numberEmployees;
  String topic;
  String jobEnvironment;
  String salaryFields;
  String educationLevel;
  String requireQualifications;
  String specialQualifications;
  bool isRequiredImage;
  String requiredLanguages;
  String experienseYears;
  String gender;
  String location;
  int companyId;
  bool isRequiredLicense;
  String status;
  String isRequiredMilitary;
  String jobTime;
  String endDate;
  Company company;

  Job({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.hiddenName,
    required this.jobTitle,
    required this.numberEmployees,
    required this.topic,
    required this.jobEnvironment,
    required this.salaryFields,
    required this.educationLevel,
    required this.requireQualifications,
    required this.specialQualifications,
    required this.isRequiredImage,
    required this.requiredLanguages,
    required this.experienseYears,
    required this.gender,
    required this.location,
    required this.companyId,
    required this.isRequiredLicense,
    required this.status,
    required this.isRequiredMilitary,
    required this.jobTime,
    required this.endDate,
    required this.company,
  });

  factory Job.fromJson(Map<String, dynamic> json) =>
      Job(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        hiddenName: json["hidden_name"] == 1,
        jobTitle: json["job_title"],
        numberEmployees: json["number_employees"],
        topic: json["topic"],
        jobEnvironment: json["job_environment"],
        salaryFields: json["salary_fields"],
        educationLevel: json["education_level"],
        requireQualifications: json["require_qualifications"],
        specialQualifications: json["special_qualifications"],
        isRequiredImage: json["is_required_image"] == 1,
        requiredLanguages: json["required_languages"],
        experienseYears: json["experiense_years"],
        gender: json["gender"],
        location: json["location"],
        companyId: json["company_id"],
        isRequiredLicense: json["is_required_license"] == 1,
        status: json["status"],
        isRequiredMilitary: json["is_required_military"],
        jobTime: json["job_time"],
        endDate: json["end_date"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "hidden_name": hiddenName ? 1 : 0,
        "job_title": jobTitle,
        "number_employees": numberEmployees,
        "topic": topic,
        "job_environment": jobEnvironment,
        "salary_fields": salaryFields,
        "education_level": educationLevel,
        "require_qualifications": requireQualifications,
        "special_qualifications": specialQualifications,
        "is_required_image": isRequiredImage ? 1 : 0,
        "required_languages": requiredLanguages,
        "experiense_years": experienseYears,
        "gender": gender,
        "location": location,
        "company_id": companyId,
        "is_required_license": isRequiredLicense ? 1 : 0,
        "status": status,
        "is_required_military": isRequiredMilitary,
        "job_time": jobTime,
        "end_date": endDate,
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
  "logo": logoValues.reverse[logo],
  "location": location,
  "about_us": aboutUs,
  };

  }
