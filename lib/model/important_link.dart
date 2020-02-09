import 'package:flutter/foundation.dart';

class ImportantLink {
  @required
  String title;
  @required
  String url;

  ImportantLink({this.title, this.url});

  Map<String, dynamic> toMap() {
    return {'title': title, 'url': url};
  }

  factory ImportantLink.fromMap(Map<dynamic, dynamic> map) {
    return ImportantLink(title: map['title'], url: map['url']);
  }

  @override
  String toString() {
    return 'Important Link : title = $title, url = $url';
  }
}