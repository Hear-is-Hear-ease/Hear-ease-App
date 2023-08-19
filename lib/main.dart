import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:flutter/services.dart';
import 'package:wav/wav.dart';

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
  static const String modelPath =
      'assets/models/lite-model_yamnet_tflite_1.tflite';
  static const String csvPath = 'assets/models/yamnet_class_map.csv';

  @override
  void initState() {
    super.initState();
    _recorder();
  }

  Future<List<double>> readWav(String filePath) async {
    final wav = await Wav.readFile(filePath);
    var mono = wav.toMono();

    return mono;
  }

  void toggleRecord() {
    setState(() {
      _recording = !_recording;
    });
    _recording ? _recorder() : _stop();
  }

  Future<List<String>> getTamNetClasses() async {
    String fileContent = await rootBundle.loadString(csvPath);

    List<String> lines = fileContent.split('\n');

    // 첫 번째 줄 (헤더)를 제거
    lines.removeAt(0);

    // 빈 줄 제거
    lines.removeWhere((line) => line.trim().isEmpty);

    // display_name만 추출
    List<String> displayNames = lines.map((line) {
      List<String> columns = line.split(',');
      String displayName = columns[2];

      // 쌍따옴표가 포함된 경우 제거
      return displayName.replaceAll('"', '').trim();
    }).toList();

    return displayNames;
  }

  Map<String, double> getNameFromScore(
      List<String> classes, List<double> prediction, int n) {
    var indexedPrediction = prediction.asMap().entries.toList();

    indexedPrediction.sort((a, b) => b.value.compareTo(a.value));

    Map<String, double> sortedMap = Map.fromEntries(indexedPrediction
        .take(n)
        .map((entry) => MapEntry(classes[entry.key], entry.value)));

    return sortedMap;
  }

  bool isBabyCry(Map<String, double> predictMap) {
    List<String> babyClasses = ['Crying', 'Baby cry', 'Babbling'];
    var targetList = predictMap.keys.toList();

    for (String target in targetList) {
      if (babyClasses.contains(target)) {
        return true;
      }
    }
    return false;
  }

  void _recorder() async {
    print("onPressed start");
    var dir = (await getApplicationDocumentsDirectory()).path;
    var filePath = '$dir/hungry_8.wav';

    var input = await readWav(filePath);

    var output = List.filled(1, List.filled(521, 0.0));

    final interpreter = await tfl.Interpreter.fromAsset(modelPath);

    // inference
    interpreter.run(input, output);

    // print the output
    var classes = await getTamNetClasses();
    var predictMap = getNameFromScore(classes, output[0], 5);
    predictMap.forEach((key, value) {
      print('$key: ${value.toStringAsFixed(2)}');
    });
    print(isBabyCry(predictMap));
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
