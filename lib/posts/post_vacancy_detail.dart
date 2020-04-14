import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/model/vacancy_item.dart';

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
            Text('VACANCY DETAILS', style: headingStyle),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: <Widget>[
                  for (var item in vacancyData) VacancyTile(item: item)
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
  final VacancyItem item;
  const VacancyTile({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _VacancyTileState createState() => _VacancyTileState();
}

class _VacancyTileState extends State<VacancyTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: 16,
        color: Theme.of(context).accentColor,
        fontWeight: FontWeight.bold);
    final bodyStyle = TextStyle(
        fontSize: 18,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold);
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
                    widget.item.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  if (isExpanded)
                    Icon(Icons.keyboard_arrow_up)
                  else
                    Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (widget.item.category != null)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Category', style: titleStyle),
                        Text(widget.item.category, style: bodyStyle),
                        SizedBox(),
                      ],
                    ),
                  ),
                if (widget.item.total != null)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Total', style: titleStyle),
                        Text(widget.item.total, style: bodyStyle),
                      ],
                    ),
                  ),
              ],
            ),
            if (widget.item.gen != null ||
                widget.item.obc != null ||
                widget.item.bca != null ||
                widget.item.bcb != null)
              Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (widget.item.gen != null)
                  Column(
                    children: <Widget>[
                      Text('GEN', style: titleStyle),
                      Text(widget.item.gen, style: bodyStyle),
                    ],
                  ),
                if (widget.item.obc != null)
                  Column(
                    children: <Widget>[
                      Text('OBC', style: titleStyle),
                      Text(widget.item.obc, style: bodyStyle),
                    ],
                  ),
                if (widget.item.bca != null)
                  Column(
                    children: <Widget>[
                      Text('BC (I)', style: titleStyle),
                      Text(widget.item.bca, style: bodyStyle),
                    ],
                  ),
                if (widget.item.bcb != null)
                  Column(
                    children: <Widget>[
                      Text('BC (II)', style: titleStyle),
                      Text(widget.item.bcb, style: bodyStyle),
                    ],
                  ),
                if (widget.item.ews != null)
                  Column(
                    children: <Widget>[
                      Text('EWS', style: titleStyle),
                      Text(widget.item.ews, style: bodyStyle),
                    ],
                  ),
                if (widget.item.sc != null)
                  Column(
                    children: <Widget>[
                      Text('SC', style: titleStyle),
                      Text(widget.item.sc, style: bodyStyle),
                    ],
                  ),
                if (widget.item.st != null)
                  Column(
                    children: <Widget>[
                      Text('ST', style: titleStyle),
                      Text(widget.item.st, style: bodyStyle),
                    ],
                  ),
                if (widget.item.ph != null)
                  Column(
                    children: <Widget>[
                      Text('PH', style: titleStyle),
                      Text(widget.item.ph, style: bodyStyle),
                    ],
                  ),
              ],
            ),
            if (widget.item.age != null) ...[
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Age', style: titleStyle),
                  Text(widget.item.age, style: bodyStyle)
                ],
              ),
            ],
            if (widget.item.eligibility != null) ...[
              Divider(),
              Text('Eligibility', style: titleStyle),
              SizedBox(height: 4),
              Text(widget.item.eligibility, style: bodyStyle),
              Divider()
            ],
          ]
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

final vacancyData = [
  VacancyItem(
      category: "01",
      name: "Name",
      gen: "Gen",
      obc: "obc",
      bca: "bca",
      bcb: "bcb",
      ews: "ews",
      sc: "sc",
      st: "st",
      ph: "ph",
      total: "120",
      age: "17 - 34 Years",
      eligibility: "Some eligibility criteria."),
  VacancyItem(
    name: 'Medical Officer MO',
    gen: "161",
    ews: "37",
    obc: "32",
    bca: "10",
    sc: "16",
    st: "124",
    total: "380",
  ),
  VacancyItem(
    name: 'Mechanical',
    gen: "52",
    obc: "32",
    ews: "12",
    sc: "20",
    st: "09",
    total: "125",
    eligibility:
        "BE/B.Tech Engineering Degree in Related Trade. General / OBC EWS : 60% Marks and SC / ST: 50% Marks",
  ),
  VacancyItem(
    name: 'Electrical (EEE)',
    gen: "25",
    obc: "19",
    ews: "06",
    sc: "10",
    st: "05",
    total: "65",
    eligibility:
        "BE/B.Tech Engineering Degree in Related Trade. General / OBC EWS : 60% Marks and SC / ST: 50% Marks",
  ),
  VacancyItem(
    name: 'Electrical (ECE)',
    gen: "06",
    obc: "01",
    ews: "01",
    sc: "01",
    st: "01",
    total: "10",
    eligibility:
        "BE/B.Tech Engineering Degree in Related Trade. General / OBC EWS : 60% Marks and SC / ST: 50% Marks",
  ),
  VacancyItem(
    category: "01",
    name: "Election Naib Tehsildar",
    gen: "04",
    bca: "01",
    bcb: "01",
    ews: "00",
    sc: "00",
    total: "06",
    eligibility: "BA / B.Com Degree in Recoginzed University in India",
  ),
  VacancyItem(
      category: "02",
      name: "Election Kanungo",
      gen: "10",
      bca: "03",
      bcb: "03",
      ews: "00",
      sc: "04",
      total: "21"),
  VacancyItem(
      name: "Apprentice",
      total: "116",
      age: "18 - 27 Years",
      eligibility: "ITI / NCVT Certificate in Related trade"),
  VacancyItem(name: "Carpenter", total: "02"),
  VacancyItem(name: "COPA", total: "23"),
  VacancyItem(
    name: "Junior Secreterial Assistant",
    total: "292",
    age: "18-27 Years",
    eligibility:
        "10+2 Intermediate in any recognized board in India with English Typing 35 WPM and Hindi Typing 30 WPM",
  ),
  VacancyItem(
      name: "Patwari",
      total: "44",
      age: "21-27",
      eligibility: "Bachelor Degree in Any Stream in any recognised university")
];
