import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/post_detail_page.dart';

class PostItemTile extends StatelessWidget {
  final Post post;

  PostItemTile({this.post});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        splashColor: Theme.of(context).accentColor.withOpacity(0.1),
        highlightColor: Theme.of(context).accentColor.withOpacity(0.1),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PostDetailPage(post: post),
                  fullscreenDialog: true));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            post.title,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
