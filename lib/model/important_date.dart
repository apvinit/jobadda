import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ImportantDate {
  @required
  Timestamp date;
  @required
  String title;

  ImportantDate({this.date, this.title});

  Map<String, dynamic> toMap() {
    return {'date': date, 'title': title};
  }

  factory ImportantDate.fromMap(Map<dynamic, dynamic> map) {
    return ImportantDate(date: map['date'], title: map['title']);
  }

  @override
  String toString() {
    return 'Important Date : title = $title, date = ${date.toString()}';
  }
}
