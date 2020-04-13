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

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (post.fees.length != 0) ...[
              Text('APPLICATION FEES', style: headingStyle),
              SizedBox(height: 8.0),
              for (var fee in post.fees)
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  padding: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.35, color: Colors.grey.shade300))),
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
                          '₹${fee.amount}',
                          style: bodyStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
            ],
            Row(
              children: <Widget>[
                Text('AGE LIMIT', style: headingStyle),
                Expanded(
                  child: Text(
                    '(as on 06 Jun 2019)',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.overline.copyWith(
                        fontSize: 14, color: Theme.of(context).accentColor),
                  ),
                ),
              ],
            ),
            for (var d in data)
              Container(
                margin: EdgeInsets.only(bottom: 4),
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 0.35, color: Colors.grey.shade300))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Text(
                        d[0],
                        style: bodyStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        d[1],
                        style: bodyStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ),
            if (post.totalVacancy != null) ...[
              SizedBox(height: 8),
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
            Text('VACANCY DETAILS', style: headingStyle),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: <Widget>[
                  VacancyTile(),
                  VacancyTile(),
                  VacancyTile(),
                  VacancyTile(),
                  VacancyTile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VacancyTile extends StatefulWidget {
  const VacancyTile({
    Key key,
  }) : super(key: key);

  @override
  _VacancyTileState createState() => _VacancyTileState();
}

class _VacancyTileState extends State<VacancyTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Header',
                    style: TextStyle(fontSize: 18),
                  ),
                  if (isExpanded)
                    Icon(Icons.keyboard_arrow_up)
                  else
                    Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
          if (isExpanded) Text('Body'),
        ],
      ),
    );
  }
}

const data = [
  ["Minimum", "17 Years"],
  ["Maximum", "42 Years"],
  ["Category No. 24, 27 37", "18 - 42 Years"],
  ["Consultant - Applied Mathematics", "30-40 Years"],
  ["Project Administrator", "25-30 Years"]
];
