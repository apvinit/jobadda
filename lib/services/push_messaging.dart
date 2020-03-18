import 'package:firebase_messaging/firebase_messaging.dart';

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
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
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
