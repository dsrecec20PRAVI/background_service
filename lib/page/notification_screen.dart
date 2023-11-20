import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final RemoteMessage message;

  const NotificationScreen({Key? key, required this.message}) : super(key: key);

  static const route = '/notification-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notification')//Text(message.notification?.title ?? 'No Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${message.notification?.title ?? 'No Title'}'),
            Text('${message.notification?.body ?? 'No Body'}'),
            Text('${message.data ?? 'No Data'}'),
          ],
        ),
      ),
    );
  }
}



