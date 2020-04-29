import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/ads.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/model/vacancy_item.dart';

class PostVacancyDetail extends StatelessWidget {
  final Post post;
  final Color color;

  PostVacancyDetail({this.post, this.color});
  @override
  Widget build(BuildContext context) {
    var headingStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(color: color);

    var bodyStyle = Theme.of(context).textTheme.subtitle1;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 4),
        color: Colors.white,
        padding: EdgeInsets.all(8),
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
            if (post.totalVacancy != null && post.totalVacancy != 0) ...[
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
            if (post.ageLimits.length != 0 || post.ageLimitAsOn.isNotEmpty)
              Row(
                children: <Widget>[
                  Text('AGE LIMIT', style: headingStyle),
                  if (post.ageLimitAsOn.isNotEmpty)
                    Expanded(
                      child: Text(
                        '(as on ${post.ageLimitAsOn})',
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            .copyWith(fontSize: 14, color: color),
                      ),
                    ),
                ],
              ),
            SizedBox(height: 8),
            if (post.ageLimits != null && post.ageLimits.length != 0)
              for (var ageLimit in post.ageLimits)
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
                          ageLimit.title,
                          style: bodyStyle,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          ageLimit.body,
                          style: bodyStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
            Center(child: getPostVacancyPageBanner()),
            Divider(),
            if (post.vacancies.length != 0) ...[
              Text('VACANCY DETAILS', style: headingStyle),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: <Widget>[
                    for (var item in post.vacancies)
                      VacancyTile(
                        item: item,
                        color: color,
                      )
                  ],
                ),
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget getPostVacancyPageBanner() {
    return AdmobBanner(
      adSize: AdmobBannerSize.LARGE_BANNER,
      adUnitId: getPostVacancyDetailPageBannerAdUnit(),
    );
  }
}

class VacancyTile extends StatefulWidget {
  final VacancyItem item;
  final Color color;
  const VacancyTile({
    Key key,
    this.item,
    this.color,
  }) : super(key: key);

  @override
  _VacancyTileState createState() => _VacancyTileState();
}

class _VacancyTileState extends State<VacancyTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        Theme.of(context).textTheme.subtitle2.copyWith(color: widget.color);
    final bodyStyle = Theme.of(context).textTheme.subtitle1;
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
                  Expanded(
                    child: Text(
                      widget.item.name,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  if (isExpanded)
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: widget.color,
                    )
                  else
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: widget.color,
                    )
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (widget.item.category != null && widget.item.category.isNotEmpty)
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
                if (widget.item.total != null && widget.item.total.isNotEmpty)
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
            if ((widget.item.gen != null && widget.item.gen.isNotEmpty) ||
                (widget.item.obc != null && widget.item.obc.isNotEmpty) ||
                (widget.item.bca != null && widget.item.bca.isNotEmpty) ||
                (widget.item.bcb != null && widget.item.bcb.isNotEmpty))
              Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (widget.item.gen != null && widget.item.gen.isNotEmpty)
                  Column(
                    children: <Widget>[
                      Text('GEN', style: titleStyle),
                      Text(widget.item.gen, style: bodyStyle),
                    ],
                  ),
                if (widget.item.obc != null && widget.item.obc.isNotEmpty)
                  Column(
                    children: <Widget>[
                      Text('OBC', style: titleStyle),
                      Text(widget.item.obc, style: bodyStyle),
                    ],
                  ),
                if (widget.item.bca != null && widget.item.bca.isNotEmpty)
                  Column(
                    children: <Widget>[
                      Text('BC (I)', style: titleStyle),
                      Text(widget.item.bca, style: bodyStyle),
                    ],
                  ),
                if (widget.item.bcb != null && widget.item.bcb.isNotEmpty)
                  Column(
                    children: <Widget>[
                      Text('BC (II)', style: titleStyle),
                      Text(widget.item.bcb, style: bodyStyle),
                    ],
                  ),
                if (widget.item.ews != null && widget.item.ews.isNotEmpty)
                  Column(
                    children: <Widget>[
                      Text('EWS', style: titleStyle),
                      Text(widget.item.ews, style: bodyStyle),
                    ],
                  ),
                if (widget.item.sc != null && widget.item.sc.isNotEmpty)
                  Column(
                    children: <Widget>[
                      Text('SC', style: titleStyle),
                      Text(widget.item.sc, style: bodyStyle),
                    ],
                  ),
                if (widget.item.st != null && widget.item.st.isNotEmpty)
                  Column(
                    children: <Widget>[
                      Text('ST', style: titleStyle),
                      Text(widget.item.st, style: bodyStyle),
                    ],
                  ),
                if (widget.item.ph != null && widget.item.ph.isNotEmpty)
                  Column(
                    children: <Widget>[
                      Text('PH', style: titleStyle),
                      Text(widget.item.ph, style: bodyStyle),
                    ],
                  ),
              ],
            ),
            if (widget.item.age != null && widget.item.age.isNotEmpty) ...[
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Age Limit', style: titleStyle),
                  Text(widget.item.age, style: bodyStyle)
                ],
              ),
            ],
            if (widget.item.eligibility != null && widget.item.eligibility.isNotEmpty) ...[
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
