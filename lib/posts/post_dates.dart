import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_date_tile.dart';

class PostDates extends StatelessWidget {
  @required
  final Post post;
  PostDates({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: post.dates.length,
        itemBuilder: (context, index) => PostDateTile(date: post.dates[index]),
      ),
    );
  }
}
