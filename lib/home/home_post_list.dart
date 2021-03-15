import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/model/post_short_info.dart';
import 'package:jobadda/posts/post_tile_shimmer.dart';
import 'package:jobadda/services/remote_api.dart';

import '../ads.dart';
import 'home_post_list_tile.dart';

class HomePostList extends StatefulWidget {
  @override
  _HomePostListState createState() => _HomePostListState();
}

class _HomePostListState extends State<HomePostList> {
  AdmobInterstitial _interstitial;
  Future<List<PostShortInfo>> postsFuture;
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    postsFuture = getRecentPosts();
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
    return FutureBuilder<List<PostShortInfo>>(
      future: postsFuture,
      builder: (context, AsyncSnapshot<List<PostShortInfo>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0)
            return Center(child: Text('No posts here.'));
          var posts = snapshot.data;
          return RefreshIndicator(
            key: _refreshKey,
            onRefresh: () async {
              setState(() {
                postsFuture = getRecentPosts();
              });
              return Future.delayed(Duration(seconds: 1));
            },
            child: ListView(
                children: posts
                    .map((post) => HomePostListTile(
                          post,
                          interstitial: _interstitial,
                        ))
                    .toList()),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text('some error occured:-<'),
          );
        } else {
          return ListView.builder(
              itemCount: 15, itemBuilder: (_, __) => PostTileShimmer());
        }
      },
    );
  }
}
