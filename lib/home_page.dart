import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/ads.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/post_item_tile.dart';
import 'package:jobadda/post_list_page.dart';
import 'package:jobadda/posts/post_tile_shimmer.dart';
import 'package:jobadda/services/database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    Widget getHeader(String title) {
      return InkWell(
        splashColor: Theme.of(context).accentColor.withOpacity(0.1),
        highlightColor: Theme.of(context).accentColor.withOpacity(0.1),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => PostListPage(title: title)));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Text(title.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
              Spacer(),
              Text(
                'See More',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      );
    }

    Widget getBody(Stream<List<Post>> future) {
      return StreamBuilder(
        stream: future,
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            var posts = snapshot.data;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: posts
                    .map((post) => PostItemTile(
                          post: post,
                          interstitial: _interstitial,
                        ))
                    .toList());
          } else {
            return Column(children: <Widget>[
              PostTileShimmer(),
              PostTileShimmer(),
              PostTileShimmer()
            ]);
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Job Adda')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getHeader('Results'),
            getBody(db.getRecentResults()),
            getHeader('Admit Cards'),
            getBody(db.getRecentAdmitCards()),
            getBannerAd(),
            getHeader('Latest Jobs'),
            getBody(db.getRecentJobs()),
            getHeader('Admissions'),
            getBody(db.getRecentAdmissions()),
            getBannerAd(),
            getHeader('Answer Keys'),
            getBody(db.getRecentAnskwerKeys()),
            getHeader('Syllabus'),
            getBody(db.getRecentSyllabus()),
            getBannerAd()
          ],
        ),
      ),
    );
  }
}
