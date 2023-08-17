import 'package:flutter/material.dart';
import 'package:hear_ease_app/screens/splash.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeSplashScreen(),
    );
  }
}
