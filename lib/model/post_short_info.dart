class PostShortInfo {
  String id;
  String title;
  String type;
  String updateDate;

  PostShortInfo({
    this.id,
    this.title,
    this.type,
    this.updateDate,
  });

  factory PostShortInfo.fromMap(Map<String, dynamic> map) {
    return PostShortInfo(
      id: map['id'],
      title: map['title'],
      type: map['type'],
      updateDate: map['updateDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'updateDate': updateDate,
    };
  }
}
