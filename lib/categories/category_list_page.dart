import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/ads.dart';
import 'package:jobadda/home/home_post_list_tile.dart';
import 'package:jobadda/model/post_short_info.dart';
import 'package:jobadda/posts/post_tile_shimmer.dart';
import 'package:jobadda/services/remote_api.dart';

class CategoryListPage extends StatefulWidget {
  @required
  final String title;

  CategoryListPage({this.title});

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  AdmobInterstitial _interstitial;
  Future<List<PostShortInfo>> future;

  @override
  void initState() {
    super.initState();

    switch (widget.title) {
      case 'Results':
        future = getPostsByType('Results');
        break;
      case 'Admit Cards':
        future = getPostsByType('Admit Card');
        break;
      case 'Latest Jobs':
        future = getPostsByType('Latest Job');
        break;
      case 'Answer Keys':
        future = getPostsByType('Answer Keys');
        break;
      case 'Admissions':
        future = getPostsByType('Admission');
        break;
      case 'Syllabus':
        future = getPostsByType('Syllabus');
        break;
    }

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
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<List<PostShortInfo>> snapshot) {
          if (snapshot.hasData) {
            var posts = snapshot.data;
            return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return HomePostListTile(posts[index],
                      interstitial: _interstitial);
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
