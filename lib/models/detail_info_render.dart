import 'package:flutter/material.dart';
import 'package:hear_ease_app/lang/detailInfo/en.dart';
import 'package:hear_ease_app/lang/detailInfo/jp.dart';
import 'package:hear_ease_app/lang/detailInfo/ko.dart';
import 'package:hear_ease_app/lang/detailInfo/lang.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/models/detail_info.dart';

class DetailInfoRender {
  BabyState babyState;
  late DetailInfoLang _detailInfoLang;
  late String lang;
  late DetailInfo _info;

  DetailInfoRender({required this.babyState, this.lang = "EN"}) {
    switch (lang.toUpperCase()) {
      case "EN":
        _detailInfoLang = DetailInfoEN();
        break;
      case "JP":
        _detailInfoLang = DetailInfoJP();
        break;
      case "KR":
      default:
        _detailInfoLang = DetailInfoKR();
        break;
    }

    _info = _detailInfoLang.getDetailInfo(babyState.state);
    _info.updatePredictionMap(babyState.predictMap);
  }

  DetailInfo get raw => _info;

  Column renderDescription() {
    List<Widget> renderList = [];
    var wordList = _info.description.split('\n');
    for (var word in wordList) {
      if (word == '') {
        renderList.add(const SizedBox(height: 12));
      } else {
        if (word.contains('**')) {
          var richWords = word.split('**');
          List<TextSpan> richRendderList = [];
          for (var i = 0; i < richWords.length; i++) {
            if (i % 2 == 0) {
              richRendderList.add(TextSpan(
                  text: richWords[i],
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(47, 199, 117, 0.99))));
            } else {
              richRendderList.add(TextSpan(
                  text: richWords[i],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(57, 141, 147, 1))));
            }
          }
          renderList.add(Text.rich(TextSpan(children: richRendderList)));
        } else {
          renderList.add(Text(word,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(47, 199, 117, 0.99),
              )));
        }
        renderList.add(const SizedBox(height: 12));
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: renderList,
    );
  }

  Image renderImage() {
    return Image.asset(_info.iconPath);
  }

  SizedBox renderPredictionInfo(double width, String state) {
    List<String> keys = babyState.predictMap.keys.toList();
    double p1 = babyState.predictMap[keys[0]]!;
    double p2 = babyState.predictMap[keys[1]]!;

    return SizedBox(
      width: width * 0.82,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(keys[0],
                  style: const TextStyle(
                    fontSize: 17,
                  )),
              const SizedBox(height: 4),
              Text(keys[1],
                  style: const TextStyle(
                    fontSize: 17,
                  )),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Text('${(p1 * 100).round()}%'),
                  const SizedBox(width: 7),
                  Container(
                    height: 15,
                    width: width *
                        (state.toLowerCase() == 'uncomfortable' ? 0.32 : 0.5) *
                        p1,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(222, 252, 185, 1),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 15,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.5),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3.0),
                          bottomRight: Radius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('${(p2 * 100).round()}%'),
                  const SizedBox(width: 7),
                  Container(
                    height: 15,
                    width: width *
                        (state.toLowerCase() == 'uncomfortable' ? 0.32 : 0.5) *
                        p2,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 239, 199, 1),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 15,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.5),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3.0),
                          bottomRight: Radius.circular(3.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  Row renderPredictBar({
    required double width,
    required double percent,
    Color color = const Color.fromRGBO(222, 252, 185, 1),
  }) {
    if (percent > 1) {
      throw "percent in renderPredictBar must be less than 1";
    }
    return Row(
      children: [
        Container(
          height: 18,
          width: width * percent,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(3.0),
              bottomLeft: Radius.circular(3.0),
            ),
          ),
        ),
        Container(
          height: 18,
          // width: width * (1 - percent),
          width: 1,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.5),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(3.0),
              bottomRight: Radius.circular(3.0),
            ),
          ),
        ),
        Text('${(percent * 100).round()}%'),
      ],
    );
  }

  Widget renderIconDesc() {
    List<String> descList = _info.iconDesc.split('\n');

    List<Widget> textList = [];
    for (var desc in descList) {
      textList.add(Text(desc,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )));
      textList.add(const SizedBox(height: 5));
    }
    return Row(
      children: [
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: textList,
        ),
      ],
    );
  }
}
