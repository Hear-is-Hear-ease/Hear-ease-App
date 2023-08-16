import 'package:flutter/material.dart';
import 'package:hear_ease_app/services/record.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late RecordService _record;
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    _record = RecordService();
    _checkHasPermission();
  }

  void _toggleRecording() {
    setState(() {
      isListening = !isListening;
    });
    print('isListening: $isListening');
    if (isListening) _waitSound();
    // Future.delayed(const Duration(seconds: 4), () {
    //   isListening = false;
    // });
  }

  void _checkHasPermission() async {
    if (await _record.checkHasPermission() == false) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You must accept permissions"),
        duration: Duration(seconds: 5),
      ));
    }
  }

  void _waitSound() async {
    var dir = (await getApplicationDocumentsDirectory()).path;
    var filePath = '$dir/tempRecord.wav';
    bool hasDetected = await _record.waitSound(filePath, () => isListening);
    if (hasDetected) {
      _notifyToUser();
      _sendToServer(filePath);
    }
  }

  void _notifyToUser() {
    print("Notify to user!");
  }

  void _sendToServer(String filepath) {
    print("Send to server with file $filepath");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Voice Recorder')),
        body: Center(
          child: ElevatedButton(
            onPressed: _toggleRecording,
            child: Text(isListening ? 'Stop Recording' : 'Start Recording'),
          ),
        ),
      ),
    );
  }
}
