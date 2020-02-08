import 'package:flutter/material.dart';
import 'package:jobadda/posts/post_link_tile.dart';

class PostLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30, itemBuilder: (context, index) => PostLinkTile());
  }
}
