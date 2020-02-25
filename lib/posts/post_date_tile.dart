import 'package:flutter/material.dart';
import 'package:jobadda/model/important_date.dart';

class PostDateTile extends StatelessWidget {
  final ImportantDate date;

  PostDateTile({this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              date.title,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              date.date,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
