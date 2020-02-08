import 'package:flutter/material.dart';
import 'package:jobadda/posts/post_date_tile.dart';

class PostDates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 35,
        itemBuilder: (context, index) => PostDateTile(),
      ),
    );
  }
}
