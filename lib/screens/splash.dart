import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hear_ease_app/screens/home.dart';

class HomeSplashScreen extends StatefulWidget {
  const HomeSplashScreen({super.key});

  @override
  State<HomeSplashScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) => const SplashLoadingScreen();
}

class SplashLoadingScreen extends StatelessWidget {
  const SplashLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(255, 239, 199, 0.97),
        child: Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 200, 71, 1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: const Color.fromRGBO(251, 160, 35, 1), width: 5),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(3),
                child: SvgPicture.asset(
                  'assets/icons/baby-smile-white.svg',
                  width: 74,
                  height: 74,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
