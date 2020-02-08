import 'package:flutter/material.dart';
import 'package:jobadda/post_item_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget getHeader(String title) {
      return InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Text(title),
              Spacer(),
              Text(
                'See More',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Job Adda')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            getHeader('Results'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
            getHeader('Admit Card'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
            getHeader('Latest Job'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
            getHeader('Answer Key'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
            getHeader('Admission'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
            getHeader('Syllabus'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
          ],
        ),
      ),
    );
  }
}
