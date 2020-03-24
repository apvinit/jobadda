import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/ads.dart';
import 'package:jobadda/model/post.dart';

class PostInfo extends StatelessWidget {
  @required
  final Post post;

  PostInfo({this.post});

  @override
  Widget build(BuildContext context) {
    var headingStyle = TextStyle(
      fontSize: 18.0,
      color: Theme.of(context).accentColor,
      fontWeight: FontWeight.bold,
    );

    var bodyStyle = TextStyle(fontSize: 18.0);

    return SingleChildScrollView(
      child: Container(
        color: Colors.white54,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('POST',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                post.name,
                style: bodyStyle,
              ),
            ),
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
            getPostInfoPageBanner(),
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
            if (post.totalVacancy != null) ...[
              Text('TOTAL POST VACANCY', style: headingStyle),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  post.totalVacancy.toString(),
                  style: bodyStyle,
                ),
              ),
              Divider(),
            ],
            if (post.fees.length != 0) ...[
              Text('APPLICATION FEES', style: headingStyle),
              SizedBox(height: 8.0),
              for (var fee in post.fees)
                Text(
                  '${fee.title} - ${fee.amount}',
                  style: bodyStyle,
                ),
              Divider(),
            ]
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
