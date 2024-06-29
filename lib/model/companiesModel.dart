class Companies {
  int? id;
  String? logo;
  String? name;
  String? topic;

  Companies({
    this.id,
    this.logo,
    this.name,
    this.topic,
  });

  factory Companies.fromJson(Map<String, dynamic> json) => Companies(
    id: json["id"],
    logo: json["logo"],
    name: json["name"],
    topic: json["topic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "name": name,
    "topic": topic,
  };
}