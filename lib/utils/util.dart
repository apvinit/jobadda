import 'package:cloud_firestore/cloud_firestore.dart';

String dateFromTimestamp(Timestamp timestamp) {
  var date = timestamp.toDate();
  return date.toString();
}
