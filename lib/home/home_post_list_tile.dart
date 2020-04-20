import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/model/post_short_info.dart';

import '../colors.dart';
import '../post_detail_page.dart';

class HomePostListTile extends StatelessWidget {
  final PostShortInfo postinfo;
  final AdmobInterstitial interstitial;

  HomePostListTile(this.postinfo, {this.interstitial});

  @override
  Widget build(BuildContext context) {
    var color;

    switch (postinfo.type) {
      case "Results":
        color = colors[0];
        break;
      case "Admit Card":
        color = colors[1];
        break;
      case "Latest Job":
        color = colors[2];
        break;
      case "Answer Keys":
        color = colors[3];
        break;

      case "Admission":
        color = colors[4];
        break;
      case "Syllabus":
        color = colors[5];
        break;
      default:
        color = Colors.cyan[600];
    }

    return Card(
      elevation: 0,
      child: InkWell(
        onTap: () async {
          if (await interstitial?.isLoaded ?? false) {
            interstitial.show();
            navigateToPostDetail(context, color);
          } else
            navigateToPostDetail(context, color);
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border(left: BorderSide(color: color, width: 6))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    postinfo.type.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: color),
                  ),
                  Text(postinfo.updatedDate ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 14)),
                ],
              ),
              SizedBox(height: 8),
              Text(postinfo.title, style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
        ),
      ),
    );
  }

  void navigateToPostDetail(BuildContext context, Color color) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => PostDetailPage(id: postinfo.id, color: color),
          fullscreenDialog: true),
    );
  }
}
