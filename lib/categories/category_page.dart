import 'package:flutter/material.dart';
import 'package:jobadda/colors.dart';

import 'category_list_page.dart';

class CatergoyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget getItem(String title, Color c) {
      return Card(
        elevation: 0,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CategoryListPage(title: title)));
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: c, width: 6)),
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: c,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: c,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getItem('Latest Jobs', latestJobColor),
          getItem('Results', resultColor),
          getItem('Admit Cards', admitCardColor),
          getItem('Answer Keys', answerKeyColor),
          getItem('Admissions', admissionColor),
          getItem('Syllabus', syllabusColor),
        ],
      ),
    );
  }
}
