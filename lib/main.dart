import 'package:flutter/material.dart';
import 'package:jobadda/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Adda',
      theme: ThemeData(
        primaryColor: Color(0xFF1A535C),
        accentColor: Color(0xFFFF735E),
      ),
      home: HomePage(),
    );
  }
}
