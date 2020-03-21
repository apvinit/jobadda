import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/post_detail_page.dart';

class PostItemTile extends StatelessWidget {
  final Post post;
  final AdmobInterstitial interstitial;

  PostItemTile({this.post, this.interstitial});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        splashColor: Theme.of(context).accentColor.withOpacity(0.1),
        highlightColor: Theme.of(context).accentColor.withOpacity(0.1),
        onTap: () async {
          if (await interstitial?.isLoaded ?? false) {
            interstitial.show();
            navigateToPostDetail(context);
          } else
            navigateToPostDetail(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            post.title,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }

  void navigateToPostDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => PostDetailPage(post: post), fullscreenDialog: true),
    );
  }
}
