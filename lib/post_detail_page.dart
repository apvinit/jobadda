import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_dates.dart';
import 'package:jobadda/posts/post_info.dart';
import 'package:jobadda/posts/post_links.dart';
import 'package:jobadda/posts/post_vacancy_detail.dart';

import 'colors.dart';

class PostDetailPage extends StatelessWidget {
  @required
  final Post post;

  PostDetailPage({this.post});
  @override
  Widget build(BuildContext context) {
    var color;

    switch (post.type) {
      case "Results":
        color = colors[0];
        break;
      case "Admit Card":
        color = colors[1];
        break;
      case "Latest Job":
        color = colors[2];
        break;
      case "Answer Keys":
        color = colors[3];
        break;

      case "Admission":
        color = colors[4];
        break;
      case "Syllabus":
        color = colors[5];
        break;
    }

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
                labelColor: color,
                indicatorColor: color,
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
                  PostInfo(post: post, color: color),
                  PostVacancyDetail(
                    post: post,
                    color: color
                  ),
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
