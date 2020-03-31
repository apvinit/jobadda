import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_dates.dart';
import 'package:jobadda/posts/post_info.dart';
import 'package:jobadda/posts/post_links.dart';
import 'package:jobadda/posts/post_vacancy_detail.dart';

class PostDetailPage extends StatelessWidget {
  @required
  final Post post;

  PostDetailPage({this.post});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(post.title),
        ),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              elevation: 2,
              child: TabBar(
                labelColor: Theme.of(context).accentColor,
                tabs: <Widget>[
                  Tab(text: 'INFO'),
                  Tab(text: 'DETAIL'),
                  Tab(text: 'DATES'),
                  Tab(text: 'LINKS')
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  PostInfo(post: post),
                  PostVacancyDetail(post: post,),
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
