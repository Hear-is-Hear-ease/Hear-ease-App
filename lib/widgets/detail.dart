import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/models/detail_info_render.dart';
import 'package:hear_ease_app/models/language.dart';

class DetailWidget extends StatefulWidget {
  final BabyState babyState;
  const DetailWidget({super.key, required this.babyState});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  late DetailInfoRender info;
  bool isInit = false;
  final LanguageService _lang = LanguageService();

  Future<void> init() async {
    var lang = await _lang.getLanguage();
    lang ??= 'EN'; // 언어가 선택되지 않았다면 영어를 보여준다.
    info = DetailInfoRender(babyState: widget.babyState, lang: lang);
    setState(() {
      isInit = true;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (isInit == false) {
      return const SizedBox(width: 1, height: 1);
    }

    return SizedBox(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          info.renderPredictionInfo(width, info.babyState.state),
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
