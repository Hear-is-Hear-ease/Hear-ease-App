import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/models/detail_info_render.dart';

class DetailWidget extends StatefulWidget {
  final BabyState babyState;
  const DetailWidget({super.key, required this.babyState});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  late DetailInfoRender info;
  @override
  void initState() {
    super.initState();
    info = DetailInfoRender(babyState: widget.babyState);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.85;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      // height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
            width: width * 0.9,
            height: 159,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.54),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8, top: 10),
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(210, 243, 251, 0.54),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      width: 100,
                      height: 94,
                      child: info.renderImage(),
                    ),
                    Text(info.raw.iconTitle,
                        style: const TextStyle(
                          color: Color.fromRGBO(57, 141, 147, 1),
                          fontSize: 14,
                        )),
                  ],
                ),
                info.renderIconDesc(),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text(info.raw.state,
              style: const TextStyle(
                fontSize: 30,
              )),
          const SizedBox(height: 22),
          info.renderPredictionInfo(width),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: const Color.fromRGBO(255, 255, 255, 0.28),
            width: width,
            child: info.renderDescription(),
          )
        ],
      ),
    );
  }
}
