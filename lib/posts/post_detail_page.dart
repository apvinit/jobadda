import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_dates.dart';
import 'package:jobadda/posts/post_detail_shimmer.dart';
import 'package:jobadda/posts/post_info.dart';
import 'package:jobadda/posts/post_links.dart';
import 'package:jobadda/posts/post_vacancy_detail.dart';
import 'package:jobadda/services/remote_api.dart';

import '../colors.dart';

class PostDetailPage extends StatelessWidget {
  @required
  final String id;

  PostDetailPage({this.id});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPostById(id),
      builder: (context, AsyncSnapshot<Post> snapshot) {
        if (snapshot.hasData) {
          var post = snapshot.data;
          var color;
          switch (post.type) {
            case "Results":
              color = resultColor;
              break;
            case "Admit Card":
              color = admitCardColor;
              break;
            case "Latest Job":
              color = latestJobColor;
              break;
            case "Answer Keys":
              color = answerKeyColor;
              break;
            case "Admission":
              color = admissionColor;
              break;
            case "Syllabus":
              color = syllabusColor;
              break;
            default:
              color = defaultColor;
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
        return PostDetailShimmer();
      },
    );
  }
}
