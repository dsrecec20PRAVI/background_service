import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:remind_me_flutter/api/firebase_api.dart';
import 'package:remind_me_flutter/page/home_screen.dart';
import 'package:remind_me_flutter/page/notification_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //BackgroundService.init();
  await FirebaseApi().initNotifications();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Push Notification',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        bodyText2: TextStyle(fontSize: 40),
      ),
    ),
    navigatorKey: navigatorKey,
    home: HomeScreen(),
    routes: {
      HomeScreen.route: (context) => HomeScreen(),
      NotificationScreen.route: (context) {
        final RemoteMessage message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
        return NotificationScreen(message: message);
      },
    },
  );
}



