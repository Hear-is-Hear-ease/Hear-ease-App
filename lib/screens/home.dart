import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/widgets/detail.dart';
import 'package:hear_ease_app/widgets/empty_detail.dart';
import 'package:hear_ease_app/widgets/listen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = DraggableScrollableController();
  BabyState? babyState;

  void _updateBabyState(BabyState value) {
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
            minChildSize: 0.08,
            initialChildSize: 0.08,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  // color: Color.fromRGBO(242, 242, 242, 1),
                  color: Color(0xFFFFEFC7),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFC3FBFF),
                        Color(0xFFFFEFC7),
                      ],
                      stops: [
                        0,
                        0.82
                      ]),
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [
                  //     Color(0xFFC3FBFF),
                  //     Color(0xFFD7CA69),
                  //     Color(0xFFD7CA67),
                  //     Color(0xFFC3FBFF),
                  //     Color(0xFFC4FBFE),
                  //     Color(0xFFC3FBFF),
                  //     Color(0xFFC3FBFF),
                  //     Color(0xFFFFEFC7),
                  //     Color(0xFFDDB62B),
                  //   ],
                  //   stops: [
                  //     0.0,
                  //     0.2895,
                  //     0.2828,
                  //     0.5, // 중간 지점을 대략적으로 추정합니다.
                  //     0.9939,
                  //     1.0, // 투명도가 100%인 경우, 위치를 정확히 지정하지 않아도 됩니다.
                  //     1.0,
                  //     0.9714,
                  //     1.0,
                  //   ],
                  // ),
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
                          babyState == null
                              ? const EmptyDetail()
                              : DetailWidget(babyState: babyState!),
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
