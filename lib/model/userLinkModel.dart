class Link {
  int? userId;
  String? title;
  String? link;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Link({
    this.userId,
    this.title,
    this.link,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    userId: json["user_id"],
    title: json["title"],
    link: json["link"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
  };
}