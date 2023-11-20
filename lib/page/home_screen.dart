import 'package:flutter/material.dart';
import '../services/background_service_isolate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = '/home-screen'; // Define a route for HomeScreen

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Background Service'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Call a function to start the background service
              BackgroundServiceIsolate.start();
            },
            child: Text('Start Background Service(Isolates)'),
          ),
          SizedBox(height: 16), // Add some spacing between buttons
          ElevatedButton(
            onPressed: () {
              // Call a function to check the status of the background service
              bool isServiceRunning = BackgroundServiceIsolate.isRunning();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Service Status(Isolates)'),
                  content: Text(
                      'Background Service is ${isServiceRunning ? 'running' : 'not running'}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Check Service Status(Isolates)'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Call a function to stop the background service
              BackgroundServiceIsolate.stop();
            },
            child: Text('Stop Background Service(Isolates)'),
          ),
        ],
      ),
    ),
  );
}