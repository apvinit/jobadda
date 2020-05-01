import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/analytics.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_dates.dart';
import 'package:jobadda/posts/post_detail_shimmer.dart';
import 'package:jobadda/posts/post_info.dart';
import 'package:jobadda/posts/post_links.dart';
import 'package:jobadda/posts/post_vacancy_detail.dart';
import 'package:jobadda/services/remote_api.dart';
import 'package:share/share.dart';

import '../colors.dart';

class PostDetailPage extends StatefulWidget {
  @required
  final String id;

  PostDetailPage({this.id});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage>
    with SingleTickerProviderStateMixin, RouteAware {
  TabController _controller;
  int selectedIndex = 0;

  final List<Tab> tabs = <Tab>[
    Tab(text: 'INFO'),
    Tab(text: 'DETAIL'),
    Tab(text: 'DATES'),
    Tab(text: 'LINKS'),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    observer.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    observer.unsubscribe(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: tabs.length,
      initialIndex: selectedIndex,
    );
    _controller.addListener(() {
      setState(() {
        if (selectedIndex != _controller.index) {
          selectedIndex = _controller.index;
          _sendCurrentTabToAnalytics();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPostById(widget.id),
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

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(post.title),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () async {
                    analytics.logShare(
                        contentType: post.type, itemId: post.id, method: null);
                    String url;
                    if (post.shortLink == null) {
                      final parameters = DynamicLinkParameters(
                        uriPrefix: getUrlPrefix(),
                        link: Uri.parse(
                          "https://jbda.in/${post.id}",
                        ),
                        androidParameters: AndroidParameters(
                          packageName: getPackageName(),
                          minimumVersion: 7,
                        ),
                        socialMetaTagParameters: SocialMetaTagParameters(
                          title: post.title,
                          description: post.info,
                          imageUrl: Uri.parse(
                            "https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg",
                          ),
                        ),
                      );

                      final longUrl = await parameters.buildUrl();

                      final shortenedLink =
                          await DynamicLinkParameters.shortenUrl(
                        longUrl,
                        DynamicLinkParametersOptions(
                          shortDynamicLinkPathLength:
                              ShortDynamicLinkPathLength.short,
                        ),
                      );
                      url = shortenedLink.shortUrl.toString();
                    } else {
                      url = post.shortLink;
                    }

                    Share.share(
                      "${post.name} \n\nSee full post here:\n$url ",
                      subject: post.title,
                    );
                  },
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(0.0),
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  elevation: 2,
                  child: TabBar(
                    controller: _controller,
                    labelColor: color,
                    indicatorColor: color,
                    tabs: tabs,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
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
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('JobAdda'),
            ),
            body: Center(
              child: Text('Some error occured :-<'),
            ),
          );
        }
        // by default show post detail shimmer
        return PostDetailShimmer();
      },
    );
  }

  String getUrlPrefix() {
    if (kReleaseMode) {
      return "https://jbda.page.link";
    }
    return "https://sjobadda.page.link";
  }

  String getPackageName() {
    if (kReleaseMode) {
      return "xyz.codingabc.jobadda";
    }
    return "xyz.codingabc.jobadda.debug";
  }

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  void _sendCurrentTabToAnalytics() {
    print('_sendCurrentTabToAnalytics $selectedIndex');
    observer.analytics
        .setCurrentScreen(screenName: '/post_detail/tab#$selectedIndex');
  }
}
