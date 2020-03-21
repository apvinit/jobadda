import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/ads.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/post_item_tile.dart';
import 'package:jobadda/services/database.dart';

import 'posts/post_tile_shimmer.dart';

class PostListPage extends StatefulWidget {
  @required
  final String title;

  PostListPage({this.title});

  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  AdmobInterstitial _interstitial;

  @override
  void initState() {
    super.initState();
    _interstitial = AdmobInterstitial(
      adUnitId: getInterstitialAdUnit(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) _interstitial.load();
      },
    );
    _interstitial.load();
  }

  @override
  void dispose() {
    _interstitial.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var db = Database();
    var future;
    switch (widget.title) {
      case 'Results':
        future = db.getResults();
        break;
      case 'Admit Cards':
        future = db.getAdmitCards();
        break;
      case 'Latest Jobs':
        future = db.getLatestJobs();
        break;
      case 'Answer Keys':
        future = db.getAnswerKeys();
        break;
      case 'Admissions':
        future = db.getAdmissions();
        break;
      case 'Syllabus':
        future = db.getSyllabus();
        break;
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            var posts = snapshot.data;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostItemTile(
                      post: posts[index], interstitial: _interstitial);
                });
          } else {
            return ListView.builder(
                itemCount: 15, itemBuilder: (_, __) => PostTileShimmer());
          }
        },
      ),
    );
  }
}
