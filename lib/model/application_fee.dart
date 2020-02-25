import 'package:flutter/foundation.dart';

class ApplicationFee {
  @required
  String title;
  @required
  String amount;

  ApplicationFee({this.title, this.amount});

  Map<String, dynamic> toMap() {
    return {'title': title, 'amount': amount};
  }

  factory ApplicationFee.fromMap(Map<dynamic, dynamic> map) {
    return ApplicationFee(title: map['title'], amount: map['amount']);
  }

  @override
  String toString() {
    return 'Application Fee: title = $title, amount = $amount';
  }
}
