class News {
  News({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.category,
    required this.content,
    required this.clickCount,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String slug;
  String image;
  String category;
  String content;
  int clickCount;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        category: json["category"],
        content: json["content"],
        clickCount: json["click_count"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
        "category": category,
        "content": content,
        "click_count": clickCount,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
