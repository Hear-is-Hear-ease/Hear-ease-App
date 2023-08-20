import 'package:flutter/material.dart';
import 'package:hear_ease_app/services/detect_cry.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _recording = false;
  bool _hasLoadModel = false;
  late DetectCryService detectCry;

  @override
  void initState() {
    super.initState();
    detectCry = DetectCryService(
        modelPath: 'assets/models/lite-model_yamnet_tflite_1.tflite',
        csvPath: 'assets/models/yamnet_class_map.csv');

    _recorder();
  }

  void toggleRecord() {
    setState(() {
      _recording = !_recording;
    });
    _recording ? _recorder() : _stop();
  }

  void _recorder() async {
    print("onPressed start");

    if (_hasLoadModel == false) {
      await detectCry.loadModelAsset();
      _hasLoadModel = true;
    }

    var dir = (await getApplicationDocumentsDirectory()).path;
    var filePath = '$dir/hungry_8.wav';

    bool isBabyCry = await detectCry.isBabyCry(filePath);
    print('isBabyCry: $isBabyCry');
  }

  void _stop() async {
    print("onPressed stop");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "What's this sound?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: toggleRecord,
                color: _recording ? Colors.grey : Colors.pink,
                textColor: Colors.white,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(25),
                child: const Icon(Icons.mic, size: 60),
              ),
              const Text(
                "Sound",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
