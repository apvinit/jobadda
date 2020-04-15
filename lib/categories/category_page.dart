import 'package:flutter/material.dart';
import 'package:jobadda/colors.dart';

import '../post_list_page.dart';

class CatergoyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget getItem(String title, int c) {
      return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => PostListPage(title: title)));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: colors[c], width: 6)),
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: colors[c],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: colors[c],
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getItem('Latest Jobs', 0),
          getItem('Results', 1),
          getItem('Admit Cards', 2),
          getItem('Answer Keys', 3),
          getItem('Admissions', 4),
          getItem('Syllabus', 5),
        ],
      ),
    );
  }
}
