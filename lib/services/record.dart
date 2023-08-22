import 'dart:io';

import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:flutter/material.dart';
import 'package:hear_ease_app/services/detect_cry.dart';
import 'package:path_provider/path_provider.dart';

class RecordService {
  bool _hasLoadModel = false;
  late DetectCryService detectCry;

  RecordService() {
    detectCry = DetectCryService(
        modelPath: 'assets/models/lite-model_yamnet_tflite_1.tflite',
        csvPath: 'assets/models/yamnet_class_map.csv');
  }

  Future<bool> checkHasPermission() async {
    return await AnotherAudioRecorder.hasPermissions;
  }

  Future<bool> waitSound(String tempFilePath, Function stopCallback) async {
    const tick = 60;
    const threshold = 100.0;
    var sumAvgPower = 0.0;

    var getOut = false;
    var times = 0;

    if (_hasLoadModel == false) {
      await detectCry.loadModelAsset();
      _hasLoadModel = true;
    }

    while (true) {
      try {
        sumAvgPower = 0.0;

        final file = File(tempFilePath);

        // 파일이 존재할 경우 삭제한다.
        if (file.existsSync()) {
          debugPrint("delete file");
          file.deleteSync();
        }

        var recorder = AnotherAudioRecorder(tempFilePath,
            audioFormat: AudioFormat.WAV, sampleRate: 16000);

        // 녹음을 시작한다.
        debugPrint("start record");
        await recorder.initialized;
        await recorder.start();

        // 60틱(3초)동안 녹음을 수행하며 평균 파워를 측정한다.
        for (var j = 0; j < tick; j++) {
          // debugPrint('sleep count $j');
          sleep(const Duration(milliseconds: 50));
          sumAvgPower +=
              (await recorder.current(channel: 0))?.metering?.averagePower ??
                  threshold;
        }

        // 3초가 끝났으니 녹음을 종료한다.
        var result = await recorder.stop();

        // 파워가 임계치 이상일 경우에만 울음소리 분석을 수행한다.
        debugPrint(
            'stop record: ${result?.duration}  |  avg: ${sumAvgPower / tick}');

        Future.delayed(const Duration(seconds: 5), () {
          getOut = true;
        });

        if (getOut) {
          // if (sumAvgPower / tick > threshold) {

          // 아이의 울음소리인지 판단한다.
          var dir = (await getApplicationDocumentsDirectory()).path;
          var filePath = '$dir/hungry_8.wav';
          bool isBabyCry = await detectCry.isBabyCry(filePath);

          // 모든 작업을 완료했음에도 사용자가 듣는 것을 멈추면 작업을 끝낸다.
          if (stopCallback() == false) {
            print("User prase stop");
            return false;
          }

          // 만약 아이의 울음소리가 맞을 경우 기다리는 것을 중단하고 분석을 수행하기 위해 함수를 종료한다.
          if (isBabyCry) return true;
        }

        sleep(const Duration(milliseconds: 100)); // 버퍼를 청소 할 여유를 준다.
      } catch (e) {
        debugPrint("ERROR");
        debugPrint(e.toString());
        // waitSound(tempFilePath, stopCallback);
      }
    }
  }
}
