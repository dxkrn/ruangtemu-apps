// To parse this JSON data, do
//
//     final callcenter = callcenterFromJson(jsonString);

import 'dart:convert';

List<AspirasiComment> aspirasiCommentFromJson(String str) =>
    List<AspirasiComment>.from(
        json.decode(str).map((x) => AspirasiComment.fromJson(x)));

String aspirasiCommentToJson(List<AspirasiComment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AspirasiComment {
  AspirasiComment({
    required this.id,
    required this.aspirationID,
    required this.comment,
    required this.userID,
    required this.createdAt,
    required this.updatedAt,
    required this.aspirationCommentsCount,
    required this.user,
  });

  int id;
  int aspirationID;
  String comment;
  int userID;
  String createdAt;
  String updatedAt;
  int? aspirationCommentsCount;
  Map user;

  factory AspirasiComment.fromJson(Map<String, dynamic> json) =>
      AspirasiComment(
        id: json["id"],
        aspirationID: json["aspiration_id"],
        comment: json["comment"],
        userID: json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["created_at"],
        aspirationCommentsCount: json["aspiration_comments_count"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aspiration_id": aspirationID,
        "comment": comment,
        "user_id": userID,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "aspiration_comments_count": aspirationCommentsCount,
        "user": user,
      };
}
