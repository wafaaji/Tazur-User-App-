import 'dart:convert';

UpdatePersonalInformationModel updatePersonalInformationModelFromJson(String str) => UpdatePersonalInformationModel.fromJson(json.decode(str));

String updatePersonalInformationModelToJson(UpdatePersonalInformationModel data) => json.encode(data.toJson());

class UpdatePersonalInformationModel {
  String? message;
  String? image;
  String? firstName;
  String? lastName;
  String? governorate;
  String? address;
  String? maritalStatus;
  String? nationality;
  String? phone;

  UpdatePersonalInformationModel({
    this.message,
    this.image,
    this.firstName,
    this.lastName,
    this.governorate,
    this.address,
    this.maritalStatus,
    this.nationality,
    this.phone,
  });

  factory UpdatePersonalInformationModel.fromJson(Map<String, dynamic> json) => UpdatePersonalInformationModel(
    message: json["message"],
    image: json["image"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    governorate: json["governorate"],
    address: json["address"],
    maritalStatus: json["marital_status"],
    nationality: json["nationality"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "first_name": firstName,
    "last_name": lastName,
    "governorate": governorate,
    "address": address,
    "marital_status": maritalStatus,
    "nationality": nationality,
    "phone": phone,
  };
}
