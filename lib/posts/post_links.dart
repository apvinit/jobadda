import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_link_tile.dart';

class PostLinks extends StatelessWidget {
  @required
  final Post post;

  PostLinks({this.post});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: post.links.length,
      itemBuilder: (context, index) => PostLinkTile(post.links[index]),
    );
  }
}
