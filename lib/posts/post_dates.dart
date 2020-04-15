import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_date_tile.dart';

class PostDates extends StatelessWidget {
  @required
  final Post post;
  PostDates({this.post});
  @override
  Widget build(BuildContext context) {
    if (post.dates.length == 0) {
      return Container(
        margin: EdgeInsets.only(top: 4),
        padding: EdgeInsets.only(top: 150),
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Image.asset('images/empty.png', height: 200),
      );
    }
    return ListView.builder(
      itemCount: post.dates.length,
      itemBuilder: (context, index) => PostDateTile(date: post.dates[index]),
    );
  }
}
