import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListenWiget extends StatefulWidget {
  const ListenWiget({super.key});

  @override
  State<ListenWiget> createState() => _ListenWigetState();
}

class _ListenWigetState extends State<ListenWiget> {
  /*
  listenState가
  * init: 초기상태로 듣고 있지 않는 상태
  * listening: 
    - 음성을 듣고 있는 상태로 3초 단위로 음성을 듣고 적당히 잘라 2초로 구성하여 모델에 넣어 아기 소리인지 판단한다.
    - 임계치 이하의 소리는 무시한다.
  * silence: 임계치 이상의 소리가 들리지 않는 상태
  * crying: 아이의 울음소리가 지속적으로 감지되는 상태
  * analysing: crying 상태일 때 아이 음성을 통해 상태를 분석하는 단계
  * done: 분석이 완료된 상태로 7가지 상태 중 하나로 분석이 완료된 상황.
   */
  String listenState = 'init';

  void toggleListening() {
    listenState == 'init' ? startListening() : endListening();
  }

  void startListening() {
    setState(() {
      listenState = 'listening';
    });
    print('start listening');
    Future.delayed(const Duration(seconds: 3), () {
      bool isBabySound = true;
      if (isBabySound && listenState == 'listening') {
        print("Define sound is baby or not.");
        setState(() {
          listenState = 'analysing';
        });
      }
    });
  }

  void endListening() {
    print('end listening');
    setState(() {
      listenState = 'init';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 184, 71, 1),
            Color.fromRGBO(251, 168, 35, 1),
          ],
        ),
      ),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              listenState == 'init'
                  ? ' 아이가 울면 알려드릴께요!\n터치하여 Hear-is 시작하기!'
                  : 'Hear-is가 소리를 듣는 중...',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 10,
          ),
          AvatarGlow(
            animate: ['listening', 'crying', 'analysing'].contains(listenState),
            endRadius: 160.0,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOut,
            child: GestureDetector(
              onTap: toggleListening,
              child: Material(
                shape: const CircleBorder(),
                elevation: 8,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 199, 110, 0.851)),
                  child: SvgPicture.asset(
                    'assets/icons/baby-smile-white.svg',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
