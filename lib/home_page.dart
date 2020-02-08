import 'package:flutter/material.dart';
import 'package:jobadda/post_item_tile.dart';
import 'package:jobadda/post_list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget getHeader(String title) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PostListPage()));
        },
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
            getHeader('Admit Cards'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
            getHeader('Latest Jobs'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
            getHeader('Answer Keys'),
            PostItemTile(),
            PostItemTile(),
            PostItemTile(),
            getHeader('Admissions'),
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
