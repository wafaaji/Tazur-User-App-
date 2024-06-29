import 'dart:convert';

GetTopicModel getTopicModelFromJson(String str) => GetTopicModel.fromJson(json.decode(str));

String getTopicModelToJson(GetTopicModel data) => json.encode(data.toJson());

class GetTopicModel {
  List<String> topics;

  GetTopicModel({
    required this.topics,
  });

  factory GetTopicModel.fromJson(Map<String, dynamic> json) => GetTopicModel(
    topics: List<String>.from(json["topics"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "topics": List<dynamic>.from(topics.map((x) => x)),
  };
}
