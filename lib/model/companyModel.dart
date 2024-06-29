class Company {
  int id;
  String name;
  Logo logo;
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
    logo: logoValues.map[json["logo"]]!,
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

enum Logo {
  COMPANY_LOGO_PNG
}

final logoValues = EnumValues({
  "company_logo.png": Logo.COMPANY_LOGO_PNG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}