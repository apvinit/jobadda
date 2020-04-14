class GeneralItem {
  String title;
  String body;

  GeneralItem({this.title, this.body});

  factory GeneralItem.fromMap(Map<String, dynamic> map) {
    return GeneralItem(
      title: map['title'],
      body: map['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "body": body,
    };
  }
}
