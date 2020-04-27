import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/bottom_nav_page.dart';

import 'services/push_messaging.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize("ca-app-pub-2582751373548446~2946588156");
  runApp(MyApp());
  configureNotification();
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Adda',
      theme: ThemeData(
        primaryColorBrightness: Brightness.dark,
        cursorColor: Colors.white,
        hintColor: Colors.white54,
        splashColor: Color(0xFFFF735E).withOpacity(0.1),
        highlightColor: Color(0xFFFF735E).withOpacity(0.1),
        primaryColor: Color(0xFF1A535C),
        accentColor: Color(0xFFFF735E),
      ),
      home: BottomNavPage(),
      navigatorKey: navigatorKey,
    );
  }
}
