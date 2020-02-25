import 'package:jobadda/utils/util.dart';

import 'important_date.dart';
import 'important_link.dart';

class Post {
  String id;
  String type;
  String title;
  String name;
  String info;
  String createdDate;
  String updatedDate;
  String organisation;
  int totalVacancy;
  List<ImportantDate> dates;
  List<ImportantLink> links;
  bool draft;

  Post({
    this.id,
    this.type,
    this.title,
    this.name,
    this.info,
    this.createdDate,
    this.updatedDate,
    this.organisation,
    this.totalVacancy,
    this.dates,
    this.links,
    this.draft,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'name': name,
      'info': info,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'organisation': organisation,
      'totalVacancy': totalVacancy,
      'dates': dates.map((date) => date.toMap()),
      'links': links.map((link) => link.toMap()),
      'draft': draft
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
        id: map['id'],
        type: map['type'],
        title: map['title'],
        createdDate: formattedDate(map['createdDate']),
        updatedDate: formattedDate(map['updatedDate']),
        name: map['name'],
        info: map['info'],
        organisation: map['organisation'],
        totalVacancy: map['totalVacancy'],
        dates: datesFromMap(map['dates']),
        links: linksFromMap(map['links']),
        draft: map['draft']);
  }

  static List<ImportantLink> linksFromMap(List<dynamic> list) {
    return list.map((e) => ImportantLink.fromMap(e)).toList();
  }

  static List<ImportantDate> datesFromMap(List<dynamic> list) {
    return list.map((e) => ImportantDate.fromMap(e)).toList();
  }

  toString() {
    return 'Post : id = $id, type = $type, title =  $title, name = $name, info = $info, createdDate = ${createdDate.toString()}, updatedDate = ${updatedDate.toString()}, draft = $draft, links = ${links.toString()}, dates = ${dates.toString()}';
  }
}
