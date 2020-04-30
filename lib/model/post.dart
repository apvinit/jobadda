import 'package:jobadda/model/application_fee.dart';
import 'package:jobadda/model/vacancy_item.dart';

import 'general_item.dart';
import 'important_date.dart';
import 'important_link.dart';

class Post {
  String id;
  String type;
  String shortLink;
  String imageLink;
  String title;
  String name;
  String info;
  String createdDate;
  String updatedDate;
  String organisation;
  int totalVacancy;
  List<ImportantDate> dates;
  List<ImportantLink> links;
  List<ApplicationFee> fees;
  List<GeneralItem> ageLimits;
  String ageLimitAsOn;
  List<VacancyItem> vacancies;
  bool draft;

  Post({
    this.id,
    this.type,
    this.shortLink,
    this.imageLink,
    this.title,
    this.name,
    this.info,
    this.createdDate,
    this.updatedDate,
    this.organisation,
    this.totalVacancy,
    this.dates,
    this.links,
    this.fees,
    this.ageLimits,
    this.ageLimitAsOn,
    this.vacancies,
    this.draft,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'imageLink': imageLink,
      'title': title,
      'name': name,
      'info': info,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'organisation': organisation,
      'totalVacancy': totalVacancy,
      'dates': dates.map((date) => date.toMap()),
      'links': links.map((link) => link.toMap()),
      'fees': fees.map((fee) => fee.toMap()),
      'ageLimits': ageLimits.map((ageLimit) => ageLimit.toMap()),
      'ageLimitAsOn': ageLimitAsOn,
      'vacancies': vacancies.map((e) => e.toMap()),
      'draft': draft,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      type: map['type'],
      shortLink: map['shortLink'],
      imageLink: map['imageLink'],
      title: map['title'],
      createdDate: map['createdDate'],
      updatedDate: map['updatedDate'],
      name: map['name'],
      info: map['info'],
      organisation: map['organisation'],
      totalVacancy: map['totalVacancy'],
      dates: datesFromMap(map['dates']),
      links: linksFromMap(map['links']),
      fees: feesFromMap(map['fees']),
      ageLimits: itemsFromMap(map['ageLimits']),
      ageLimitAsOn: map['ageLimitAsOn'] ?? "",
      vacancies: vacanciesFromMap(map['vacancies']),
      draft: map['draft'],
    );
  }

  static List<ImportantLink> linksFromMap(List<dynamic> list) {
    if (list == null) return [];
    return list.map((e) => ImportantLink.fromMap(e)).toList();
  }

  static List<ImportantDate> datesFromMap(List<dynamic> list) {
    if (list == null) return [];
    return list.map((e) => ImportantDate.fromMap(e)).toList();
  }

  static List<ApplicationFee> feesFromMap(List<dynamic> list) {
    if (list == null) return [];
    return list.map((e) => ApplicationFee.fromMap(e)).toList();
  }

  static List<GeneralItem> itemsFromMap(List<dynamic> list) {
    if (list == null) return [];
    return list.map((e) => GeneralItem.fromMap(e)).toList();
  }

  static List<VacancyItem> vacanciesFromMap(List<dynamic> list) {
    if (list == null) return [];
    return list.map((e) => VacancyItem.fromMap(e)).toList();
  }

  toString() {
    return 'Post : id = $id, type = $type, title =  $title, name = $name, info = $info, createdDate = ${createdDate.toString()}, updatedDate = ${updatedDate.toString()}, draft = $draft, links = ${links.toString()}, dates = ${dates.toString()}, fees = ${fees.toString()}';
  }
}
