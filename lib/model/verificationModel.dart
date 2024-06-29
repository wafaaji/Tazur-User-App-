class Verfication {
  int code;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Verfication({
    required this.code,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Verfication.fromJson(Map<String, dynamic> json) => Verfication(
    code: json["code"],
    email: json["email"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "email": email,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}