class TrainingCourse {
  int? userId;
  String? name;
  String? source;
  String? duration;
  String? details;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? image;

  TrainingCourse({
    this.userId,
    this.name,
    this.source,
    this.duration,
    this.details,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.image,
  });

  factory TrainingCourse.fromJson(Map<String, dynamic> json) => TrainingCourse(
    userId: json["user_id"],
    name: json["name"],
    source: json["source"],
    duration: json["duration"],
    details: json["details"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "source": source,
    "duration": duration,
    "details": details,
    "image": image,
  };
}