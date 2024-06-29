import 'dart:convert';

ShowProfileModel showProfileModelFromJson(String str) => ShowProfileModel.fromJson(json.decode(str));

String showProfileModelToJson(ShowProfileModel data) => json.encode(data.toJson());

class ShowProfileModel {
  String? image;
  String firstName;
  String lastName;
  String email;
  String? cvFile;

  ShowProfileModel({
    this.image,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.cvFile,
  });

  factory ShowProfileModel.fromJson(Map<String, dynamic> json) => ShowProfileModel(
    image: json["image"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    cvFile: json["cv_file"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "cv_file": cvFile,
  };
}
