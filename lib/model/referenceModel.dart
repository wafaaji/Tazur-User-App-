class Reference {
  int? userId;
  String? name;
  String? employment;
  String? email;
  String? phone;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Reference({
    this.userId,
    this.name,
    this.employment,
    this.email,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
    userId: json["user_id"],
    name: json["name"],
    employment: json["employment"],
    email: json["email"],
    phone: json["phone"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "employment": employment,
    "email": email,
    "phone": phone,
  };
}