import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_tile_shimmer.dart';
import 'package:jobadda/services/database.dart';

import '../ads.dart';
import 'home_post_list_tile.dart';

class HomePostList extends StatefulWidget {
  @override
  _HomePostListState createState() => _HomePostListState();
}

class _HomePostListState extends State<HomePostList> {
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
    return StreamBuilder(
      stream: Database().getRecentPosts(),
      builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          var posts = snapshot.data;
          return ListView(
              children: posts
                  .map((post) => HomePostListTile(
                        post,
                        interstitial: _interstitial,
                      ))
                  .toList());
        } else {
          return ListView.builder(
              itemCount: 15, itemBuilder: (_, __) => PostTileShimmer());
        }
      },
    );
  }
}
