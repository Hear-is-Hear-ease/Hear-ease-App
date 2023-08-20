import 'package:flutter/material.dart';
import 'package:hear_ease_app/widgets/detail.dart';
import 'package:hear_ease_app/widgets/listen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = DraggableScrollableController();
  String? babyState;

  void _updateBabyState(String value) {
    setState(() {
      babyState = value;
      _controller.animateTo(0.9, // Go to the maximum size
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              _controller.animateTo(0.1, // Go to the minimum size
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: ListenWiget(onBabyStateUpdate: _updateBabyState),
          ),
          DraggableScrollableSheet(
            controller: _controller,
            minChildSize: 0.1,
            initialChildSize: 0.1,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(242, 242, 242, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      ),
                      Container(height: 0),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          DetailWidget(babyState: babyState),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
