import 'dart:ui';

import 'package:flutter/material.dart';
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
    await Future.delayed(const Duration(seconds: 2), () {
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
  Widget build(BuildContext context) => TriangleSplitScreen();
}

class TriangleSplitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lower Triangle with Text
          CustomPaint(
            painter: TrianglePainter(isUpperTriangle: false),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ClipPath(
                clipper: TriangleClipper(isUpperTriangle: false),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 520),
                                  Text(
                                    'Hear Is',
                                    textAlign: TextAlign.right, // 텍스트 오른쪽 정렬
                                    style: TextStyle(
                                      fontSize: 44,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Hear ease',
                                    textAlign: TextAlign.right, // 텍스트 오른쪽 정렬
                                    style: TextStyle(
                                      fontSize: 44,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              '@데청캠 과기대 1조',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),

          // Upper Triangle with Image
          CustomPaint(
            painter: TrianglePainter(isUpperTriangle: true),
            child: Align(
              alignment: Alignment.topRight,
              child: ClipPath(
                clipper: TriangleClipper(isUpperTriangle: true),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/splash.jpg',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2 + 200,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: const Color.fromRGBO(0, 0, 0, 0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final bool isUpperTriangle;

  TrianglePainter({required this.isUpperTriangle});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.fromRGBO(255, 173, 42, 0.9)
      ..style = PaintingStyle.fill;

    final Path path = Path();
    if (isUpperTriangle) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(0, size.height / 2 + 200);
      path.lineTo(0, 0);
    } else {
      path.moveTo(size.width, size.height / 2);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, size.height / 2 + 200);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TriangleClipper extends CustomClipper<Path> {
  final bool isUpperTriangle;

  TriangleClipper({required this.isUpperTriangle});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    if (isUpperTriangle) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(0, size.height / 2 + 200);
      path.lineTo(0, 0);
    } else {
      path.moveTo(size.width, size.height / 2);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, size.height / 2 + 200);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
