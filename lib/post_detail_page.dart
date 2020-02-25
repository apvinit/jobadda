import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_dates.dart';
import 'package:jobadda/posts/post_info.dart';
import 'package:jobadda/posts/post_links.dart';

class PostDetailPage extends StatelessWidget {
  @required
  final Post post;

  PostDetailPage({this.post});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Post Detail'),
        ),
        body: Column(
          children: <Widget>[
            TabBar(
              tabs: <Widget>[
                Tooltip(
                    message: 'Post Info',
                    preferBelow: false,
                    child: Tab(
                        icon: Icon(Icons.info,
                            color: Theme.of(context).accentColor))),
                Tooltip(
                    preferBelow: false,
                    message: 'Important Dates',
                    child: Tab(
                        icon: Icon(Icons.date_range,
                            color: Theme.of(context).accentColor))),
                Tooltip(
                    preferBelow: false,
                    message: 'Important Links',
                    child: Tab(
                        icon: Icon(Icons.link,
                            color: Theme.of(context).accentColor)))
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  PostInfo(post: post),
                  PostDates(post: post),
                  PostLinks(post: post)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
