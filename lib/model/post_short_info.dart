class PostShortInfo {
  String id;
  String title;
  String type;
  String updatedDate;

  PostShortInfo({
    this.id,
    this.title,
    this.type,
    this.updatedDate,
  });

  factory PostShortInfo.fromMap(Map<String, dynamic> map) {
    return PostShortInfo(
      id: map['id'],
      title: map['title'],
      type: map['type'],
      updatedDate: map['updatedDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'updatedDate': updatedDate,
    };
  }
}
