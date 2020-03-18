import 'package:flutter/material.dart';
import 'package:jobadda/home_page.dart';

import 'services/push_messaging.dart';

void main() {
  runApp(MyApp());
  configureNotification();
}

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
