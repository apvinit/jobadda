import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/home_page.dart';

import 'services/push_messaging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize("ca-app-pub-2582751373548446~2946588156");
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
      navigatorKey: navigatorKey,
    );
  }
}
