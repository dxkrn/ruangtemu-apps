// To parse this JSON data, do
//
//     final callcenter = callcenterFromJson(jsonString);

import 'dart:convert';

List<Aspirasi> aspirasiFromJson(String str) =>
    List<Aspirasi>.from(json.decode(str).map((x) => Aspirasi.fromJson(x)));

String aspirasiToJson(List<Aspirasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Aspirasi {
  Aspirasi({
    required this.id,
    required this.message,
    required this.userID,
    required this.createdAt,
    required this.updatedAt,
    required this.aspirationCommentsCount,
    required this.user,
  });

  int id;
  String message;
  int userID;
  String createdAt;
  String updatedAt;
  int aspirationCommentsCount;
  Map user;

  factory Aspirasi.fromJson(Map<String, dynamic> json) => Aspirasi(
        id: json["id"],
        message: json["message"],
        userID: json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["created_at"],
        aspirationCommentsCount: json["aspiration_comments_count"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "user_id": userID,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "aspiration_comments_count": aspirationCommentsCount,
        "user": user,
      };
}
