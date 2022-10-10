class Information {
  Information(
      {required this.iD,
      required this.postAuthor,
      required this.postDate,
      required this.postDateGmt,
      required this.postContent,
      required this.postTitle,
      required this.postExcerpt,
      required this.postStatus,
      required this.commentStatus,
      required this.pingStatus,
      required this.postPassword,
      required this.postName,
      required this.toPing,
      required this.pinged,
      required this.postModified,
      required this.postModifiedGmt,
      required this.postContentFiltered,
      required this.postParent,
      required this.guid,
      required this.menuOrder,
      required this.postType,
      required this.postMimeType,
      required this.commentCount,
      required this.canonicalUrl});

  int iD;
  int postAuthor;
  String postDate;
  String postDateGmt;
  String postContent;
  String postTitle;
  String postExcerpt;
  String postStatus;
  String commentStatus;
  String pingStatus;
  String postPassword;
  String postName;
  String toPing;
  String pinged;
  String postModified;
  String postModifiedGmt;
  String postContentFiltered;
  int postParent;
  String guid;
  int menuOrder;
  String postType;
  String postMimeType;
  int commentCount;
  String canonicalUrl;

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      iD: json["ID"],
      postAuthor: json["post_author"],
      postDate: json["post_date"],
      postDateGmt: json["post_date_gmt"],
      postContent: json["post_content"],
      postTitle: json["post_title"],
      postExcerpt: json["post_excerpt"],
      postStatus: json["post_status"],
      commentStatus: json["comment_status"],
      pingStatus: json["ping_status"],
      postPassword: json["post_password"],
      postName: json["post_name"],
      toPing: json["to_ping"],
      pinged: json["pinged"],
      postModified: json["post_modified"],
      postModifiedGmt: json["post_modified_gmt"],
      postContentFiltered: json["post_content_filtered"],
      postParent: json["post_parent"],
      guid: json["guid"],
      menuOrder: json["menu_order"],
      postType: json["post_type"],
      postMimeType: json["post_mime_type"],
      commentCount: json["comment_count"],
      canonicalUrl: json["canonical_url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ID": iD,
      "post_author": postAuthor,
      "post_date": postDate,
      "post_date_gmt": postDateGmt,
      "post_content": postContent,
      "post_title": postTitle,
      "post_excerpt": postExcerpt,
      "post_status": postStatus,
      "comment_status": commentStatus,
      "ping_status": pingStatus,
      "post_password": postPassword,
      "post_name": postName,
      "to_ping": toPing,
      "pinged": pinged,
      "post_modified": postModified,
      "post_modified_gmt": postModifiedGmt,
      "post_content_filtered": postContentFiltered,
      "post_parent": postParent,
      "guid": guid,
      "menu_order": menuOrder,
      "post_type": postType,
      "post_mime_type": postMimeType,
      "comment_count": commentCount,
      "canonical_url": canonicalUrl,
    };
  }
}
