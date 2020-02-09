import 'important_date.dart';
import 'important_link.dart';

class Post {
  String id;
  String type;
  String title;
  String name;
  String info;
  DateTime createdDate;
  DateTime updatedDate;
  String organisation;
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
        name: map['name'],
        info: map['info'],
        createdDate: map['createdDate'],
        updatedDate: map['updatedDate'],
        dates: map['dates'],
        links: map['links'],
        draft: map['draft']);
  }

  toString() {
    return 'Post : id = $id, type = $type, title =  $title, name = $name, info = $info, createdDate = ${createdDate.toString()}, updatedDate = ${updatedDate.toString()}, draft = $draft, links = ${links.toString()}, dates = ${dates.toString()}';
  }
}
