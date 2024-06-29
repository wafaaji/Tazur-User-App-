class User {
  int id;
  String email;
  DateTime emailVerifiedAt;
  dynamic firstName;
  dynamic lastName;
  String phone;
  dynamic governorate;
  dynamic address;
  dynamic gender;
  dynamic maritalStatus;
  dynamic birthday;
  dynamic nationality;
  dynamic experienceYesrs;
  dynamic education;
  dynamic topic;
  dynamic drivingLicense;
  dynamic militaryStatus;
  int completeState;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    required this.emailVerifiedAt,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.governorate,
    required this.address,
    required this.gender,
    required this.maritalStatus,
    required this.birthday,
    required this.nationality,
    required this.experienceYesrs,
    required this.education,
    required this.topic,
    required this.drivingLicense,
    required this.militaryStatus,
    required this.completeState,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    governorate: json["governorate"],
    address: json["address"],
    gender: json["gender"],
    maritalStatus: json["marital_status"],
    birthday: json["birthday"],
    nationality: json["nationality"],
    experienceYesrs: json["experience_yesrs"],
    education: json["education"],
    topic: json["topic"],
    drivingLicense: json["driving_license"],
    militaryStatus: json["military_status"],
    completeState: json["complete_state"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "governorate": governorate,
    "address": address,
    "gender": gender,
    "marital_status": maritalStatus,
    "birthday": birthday,
    "nationality": nationality,
    "experience_yesrs": experienceYesrs,
    "education": education,
    "topic": topic,
    "driving_license": drivingLicense,
    "military_status": militaryStatus,
    "complete_state": completeState,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}