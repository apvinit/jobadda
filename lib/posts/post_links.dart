import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_link_tile.dart';

class PostLinks extends StatelessWidget {
  @required
  final Post post;

  PostLinks({this.post});
  @override
  Widget build(BuildContext context) {
    if (post.links.length == 0) {
      return Container(
        margin: EdgeInsets.only(top: 4),
        padding: EdgeInsets.only(top: 150),
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Image.asset('images/empty.png', height: 200),
      );
    } else {
      return ListView.builder(
        itemCount: post.links.length,
        itemBuilder: (context, index) => PostLinkTile(post.links[index]),
      );
    }
  }
}
