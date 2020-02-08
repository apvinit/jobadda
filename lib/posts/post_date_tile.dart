import 'package:flutter/material.dart';

class PostDateTile extends StatelessWidget {
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
              'Title of the date',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '23 Dec 18',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ]),
      ),
    );
  }
}
