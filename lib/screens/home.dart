import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListening = false;
  bool isanalizing = false;

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    final double mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 181, 63, 1),
                Color.fromRGBO(250, 169, 40, 1),
              ],
            ),
          ),
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
                          color: Color.fromRGBO(255, 195, 99, 0.853)),
                      child: SvgPicture.asset(
                        'assets/icons/ph_baby_white.svg',
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
