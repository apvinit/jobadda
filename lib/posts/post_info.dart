import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/ads.dart';
import 'package:jobadda/model/post.dart';

class PostInfo extends StatelessWidget {
  @required
  final Post post;
  final Color color;

  PostInfo({this.post, this.color});

  @override
  Widget build(BuildContext context) {
    var headingStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(color: color);

    var bodyStyle = Theme.of(context).textTheme.subtitle1;

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 4),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('POST', style: headingStyle),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                post.name,
                style: bodyStyle,
              ),
            ),
            Divider(),
            getPostInfoPageBanner(),
            Divider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('POSTED ON', style: headingStyle),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          post.createdDate,
                          style: bodyStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('UPDATED ON', style: headingStyle),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          post.updatedDate,
                          style: bodyStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Text('ORGANISATION', style: headingStyle),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                post.organisation,
                style: bodyStyle,
              ),
            ),
            Divider(),
            Text('SHORT INFO', style: headingStyle),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                post.info,
                style: bodyStyle,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget getPostInfoPageBanner() {
    return AdmobBanner(
      adSize: AdmobBannerSize.LARGE_BANNER,
      adUnitId: getPostInfoPageBannerAdUnit(),
    );
  }
}
