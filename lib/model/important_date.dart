import 'package:flutter/foundation.dart';
import 'package:jobadda/utils/util.dart';

class ImportantDate {
  @required
  String date;
  @required
  String title;

  ImportantDate({this.date, this.title});

  Map<String, dynamic> toMap() {
    return {'date': date, 'title': title};
  }

  factory ImportantDate.fromMap(Map<dynamic, dynamic> map) {
    return ImportantDate(date: dateFromTimestamp(map['date']), title: map['title']);
  }

  @override
  String toString() {
    return 'Important Date : title = $title, date = ${date.toString()}';
  }
}
