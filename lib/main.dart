import 'package:flutter/material.dart';
import 'package:hear_ease_app/services/ffmpeg.dart';
import 'package:hear_ease_app/utils/os.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FfmpegService ff;

  @override
  void initState() {
    super.initState();
    ff = FfmpegService();
  }

  void _onClick() async {
    print("_onClick!");

    var dir = (await getApplicationDocumentsDirectory()).path;
    var filePath = '$dir/tempRecord.wav';
    var newFilePath = '$dir/copyRecord.wav';
    var trimFilePath = '$dir/trimRecord.wav';

    if (OsUtils.isFileExist(newFilePath)) {
      OsUtils.deleteFile(newFilePath);
    }
    if (OsUtils.isFileExist(trimFilePath)) {
      OsUtils.deleteFile(trimFilePath);
    }
    OsUtils.copyFile(filePath, newFilePath);
    if (await ff.trimAudio(newFilePath, trimFilePath)) {
      print("Sucess");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Voice Recorder')),
        body: Center(
          child: ElevatedButton(
            onPressed: _onClick,
            child: const Text('Click'),
          ),
        ),
      ),
    );
  }
}
