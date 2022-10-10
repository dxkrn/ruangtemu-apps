// To parse this JSON data, do
//
//     final callcenter = callcenterFromJson(jsonString);

import 'dart:convert';

List<Survey> surveyFromJson(String str) =>
    List<Survey>.from(json.decode(str).map((x) => Survey.fromJson(x)));

String surveyToJson(List<Survey> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Survey {
  Survey({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.clickCount,
    required this.createdAt,
    required this.updatedAt,
    logoUrl,
    authorName,
  });

  int id;
  String name;
  String description;
  String url;
  String? logoUrl;
  String? authorName;
  int clickCount;
  DateTime createdAt;
  DateTime updatedAt;

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        logoUrl: json["logo_url"],
        authorName: json["author_name"],
        clickCount: json["click_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "logo_url": logoUrl,
        "author_name": authorName,
        "click_count": clickCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
