// To parse this JSON data, do
//
//     final callcenter = callcenterFromJson(jsonString);

import 'dart:convert';

List<Callcenter> callcenterFromJson(String str) =>
    List<Callcenter>.from(json.decode(str).map((x) => Callcenter.fromJson(x)));

String callcenterToJson(List<Callcenter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Callcenter {
  Callcenter({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.logoUrl,
    required this.clickCount,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String description;
  String url;
  dynamic logoUrl;
  int clickCount;
  DateTime createdAt;
  DateTime updatedAt;

  factory Callcenter.fromJson(Map<String, dynamic> json) => Callcenter(
        id: json["id"],
        name: json["name"],
        description: json["description"] ?? '',
        url: json["url"],
        logoUrl: json["logo_url"],
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
        "click_count": clickCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
