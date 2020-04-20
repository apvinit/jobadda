import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_dates.dart';
import 'package:jobadda/posts/post_info.dart';
import 'package:jobadda/posts/post_links.dart';
import 'package:jobadda/posts/post_vacancy_detail.dart';
import 'package:jobadda/services/remote_api.dart';

class PostDetailPage extends StatelessWidget {
  @required
  final String id;
  final Color color;

  PostDetailPage({this.id, this.color});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPostById(id),
      builder: (context, AsyncSnapshot<Post> snapshot) {
        if (snapshot.hasData) {
          var post = snapshot.data;
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
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                        PostVacancyDetail(post: post, color: color),
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
        // by default show post detail shimmer
        // for now use circular progress indicator
        return CircularProgressIndicator();
      },
    );
  }
}
