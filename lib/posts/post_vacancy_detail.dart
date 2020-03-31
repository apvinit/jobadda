import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';

class PostVacancyDetail extends StatelessWidget {
  final Post post;

  PostVacancyDetail({this.post});
  @override
  Widget build(BuildContext context) {
    var headingStyle = TextStyle(
      fontSize: 18.0,
      color: Theme.of(context).accentColor,
      fontWeight: FontWeight.bold,
    );

    var bodyStyle = TextStyle(fontSize: 18.0);

    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
              Container(
                margin: EdgeInsets.only(bottom: 4),
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.35, color: Colors.grey.shade300))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Text(
                        fee.title,
                        style: bodyStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        fee.amount,
                        style: bodyStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
          ]
        ],
      ),
    );
  }
}
