import 'package:flutter/material.dart';

class EmptyDetail extends StatelessWidget {
  const EmptyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.85;
    return SizedBox(
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightBlue.shade100, // 연한 파랑색 테두리
                    width: 3.0, // 테두리 두께
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.mic_none,
                    size: 80.0,
                    color: Colors.lightBlue[300], // 연한 파랑색 마이크 아이콘
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                "Hear-is를 시작해 음성을 들려주세요!",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
            ],
          ),
        ));
  }
}
