import 'package:flutter/material.dart';
import 'package:jobadda/post_detail_page.dart';
import 'package:jobadda/services/database.dart';
import 'package:shimmer/shimmer.dart';

import 'model/post.dart';

class PushNotificationPostDetail extends StatelessWidget {
  final String postId;

  PushNotificationPostDetail({this.postId});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: Database().getPostById(postId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PostDetailPage(post: snapshot.data);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Loading...'),
          ),
          body: Shimmer.fromColors(
            highlightColor: Colors.grey[100],
            baseColor: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 18,
                    width: 240,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 18),
                  Container(
                    height: 18,
                    width: 240,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 18),
                  Container(
                    height: 18,
                    width: 240,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 18),
                  Container(
                    height: 18,
                    width: 240,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
