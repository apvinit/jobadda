import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/posts/post_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

void configureNotification() {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.subscribeToTopic('default');
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      // called when app is in foreground
    },
    onBackgroundMessage: myBackgroundMessageHandler,
    onLaunch: (Map<String, dynamic> message) async {
      // called when app is terminated
      final dynamic data = message['data'];

      final String url = data["url"];
      if (url != null && await canLaunch(url)) {
        launch(url);
        return;
      }

      final String postId = data['postId'];
      if (postId != null) {
        navigateToPostDetail(postId);
      }
    },
    onResume: (Map<String, dynamic> message) async {
      // called when app is in background
      final dynamic data = message['data'];

      final String url = data["url"];
      if (url != null && await canLaunch(url)) {
        launch(url);
        return;
      }

      final String postId = data['postId'];
      if (postId != null) {
        navigateToPostDetail(postId);
      }
    },
  );
}

void navigateToPostDetail(String postId) async {
  navigatorKey.currentState.push(
    MaterialPageRoute(
        builder: (_) => PostDetailPage(id: postId), fullscreenDialog: true),
  );
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  print("onBackgroundMessage: $message");
  if (message.containsKey('data')) {
    // Handle data message

    print("backgroundHandler : contains data");
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    print("backgroundHandler : contains notification");
  }

  // Or do other work.
  return null;
}
