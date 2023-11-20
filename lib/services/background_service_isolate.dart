import 'dart:async';
import 'dart:isolate';

class BackgroundServiceIsolate {
  static Isolate? _isolate;
  static bool _isRunning = false;

  static void start() {
    if (!_isRunning) {
      isolateFunc();
    }
  }

  static void stop() {
    if (_isRunning && _isolate != null) {
      _isolate!.kill(priority: Isolate.immediate);
      _isolate = null;
      _isRunning = false;
    }
  }

  static bool isRunning() {
    return _isRunning;
  }

  static void isolateFunc() async {
    final receivePort = ReceivePort();

    try {
      _isRunning = true;
      _isolate = await Isolate.spawn(
        runTask,
        {'stopPort': receivePort.sendPort},
      );
    } catch (e) {
      print('Isolate Failed: $e');
      receivePort.close();
      _isRunning = false;
    }
  }

  static void runTask(Map<String, dynamic> args) {
    final stopPort = ReceivePort();
    final sendPort = args['stopPort'] as SendPort;

    stopPort.listen((_) {
      print('Stopping task');
      stopPort.close();
      sendPort.send(null);
    });

    while (true) {
      Future.delayed(const Duration(seconds: 1), () {
        print('Simulacija zadatka');
      });
    }
  }
}
