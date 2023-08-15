import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListenWiget extends StatefulWidget {
  const ListenWiget({super.key});

  @override
  State<ListenWiget> createState() => _ListenWigetState();
}

class _ListenWigetState extends State<ListenWiget> {
  bool isListening = false;

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
          Text(isListening ? 'Hear-is가 듣는 중...' : '터치하여 Hear-is 시작하기!',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 40,
          ),
          AvatarGlow(
            animate: isListening,
            endRadius: 180.0,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOut,
            child: GestureDetector(
              onTap: () => setState(() {
                isListening = !isListening;
              }),
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
          )
        ],
      ),
    );
  }
}
