import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:jobadda/posts/post_detail_page.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void configureNotification() {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.subscribeToTopic('users');
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    },
    onBackgroundMessage: myBackgroundMessageHandler,
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
      final dynamic data = message['data'];
      final String postId = data['postId'];
      navigateToPostDetail(postId);
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
      final dynamic data = message['data'];
      final String postId = data['postId'];
      navigateToPostDetail(postId);
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
  }

  if (message.containsKey('notification')) {
    // Handle notification message
  }

  // Or do other work.
  return null;
}
