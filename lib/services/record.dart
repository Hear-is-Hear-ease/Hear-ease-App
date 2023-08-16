import 'dart:io';

import 'package:another_audio_recorder/another_audio_recorder.dart';

class RecordService {
  Future<bool> checkHasPermission() async {
    return await AnotherAudioRecorder.hasPermissions;
  }

  Future<bool> waitSound(String tempFilePath, Function stopCallback) async {
    const tick = 60;
    const threshold = 100.0;
    var sumAvgPower = 0.0;

    do {
      try {
        sumAvgPower = 0.0;

        final file = File(tempFilePath);
        if (file.existsSync()) {
          print("delete file");
          file.deleteSync();
        }

        print("create file");
        var _recorder = AnotherAudioRecorder(tempFilePath,
            audioFormat: AudioFormat.WAV, sampleRate: 16000);
        await _recorder.initialized;
        await _recorder.start();

        for (var j = 0; j < tick; j++) {
          // print('sleep count $j');
          sleep(const Duration(milliseconds: 50));
          sumAvgPower +=
              (await _recorder.current(channel: 0))?.metering?.averagePower ??
                  threshold;
        }

        var result = await _recorder.stop();
        print('stop file: ${result?.duration}');
        print('avg: ${sumAvgPower / tick}');

        // 모든 작업을 완료했음에도 사용자가 듣는 것을 멈추면 작업을 끝낸다.
        if (stopCallback() == false) {
          print("User prase stop");
          return false;
        }

        sleep(const Duration(milliseconds: 100)); // 버퍼를 청소 할 여유를 준다.
      } catch (e) {
        print("ERROR");
        print(e);
      }
    } while (true);
    // } while (sumAvgPower / tick < threshold);

    return true;
  }
}
