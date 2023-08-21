import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/models/detail_info.dart';

class DetailInfoRender {
  BabyState babyState;
  late DetailInfo _info;

  static DetailInfo diaperInfo = DetailInfo(
      state: 'Diaper',
      predictionMap: {'Diaper': 72.3, 'Hunery': 21.1},
      iconPath: 'assets/icons/baby-diaper-color.png',
      iconTitle: '새 기저귀가 필요해요!',
      iconDesc: '아이가 불안해 보이는\n표정을 짓거나 졸린듯\n눈을 게슴츠레\n뜨고 있지는 않나요?',
      description:
          '아기가 우는 주요한 \n원인 중 하나는 아기 기저귀의 상태가 \n좋지 않을 때에요!\n기저귀가 **젖어** 불편하다는 신호입니다. \n\n아기가 쾌적함을 느낄 수 있게 기저귀를 \n**갈아주는** 것을 추천합니다.\n\n추가적으로 아기의 **용변** 상태와 \n기저귀 **발진**이 생기지 않았는지 확인해주세요. \n');

  DetailInfoRender({required this.babyState}) {
    switch (babyState.state.toLowerCase()) {
      case 'hungry':
        // case 'diaper':
        _info = diaperInfo;
        _info.updatePredictionMap(babyState.predictMap);
        break;

      default:
        // throw "Unknown type of baby state";
        _info = diaperInfo;
        _info.updatePredictionMap(babyState.predictMap);
    }
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

  Column renderPredictionInfo(double width) {
    List<String> keys = babyState.predictMap.keys.toList();
    return Column(
      children: [
        SizedBox(
          width: width * 0.82,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(keys[0],
                style: const TextStyle(
                  fontSize: 17,
                )),
            renderPredictBar(
                width: width * 0.6, percent: babyState.predictMap[keys[0]]!),
          ]),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width * 0.82,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(keys[1],
                style: const TextStyle(
                  fontSize: 17,
                )),
            renderPredictBar(
                width: width * 0.6,
                percent: babyState.predictMap[keys[1]]!,
                color: const Color.fromRGBO(255, 239, 199, 1)),
          ]),
        ),
      ],
    );
  }

  Image renderImage() {
    return Image.asset(_info.iconPath);
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
          width: width * (1 - percent),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 0.5),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(3.0),
              bottomRight: Radius.circular(3.0),
            ),
          ),
        ),
      ],
    );
  }

  Column renderIconDesc() {
    List<String> descList = _info.iconDesc.split('\n');

    List<Widget> textList = [];
    for (var desc in descList) {
      textList.add(Text(desc,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          )));
      textList.add(const SizedBox(height: 5));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textList,
    );
  }
}


/*
1. 글의 \n\n 를 찾아 \n 으로 구분하여 List<String>을 구성한다.
2. \n, **의 시작지점을 찾는다.
    2. \n 일 경우 거기서 멈추고 새로운 Text()를 시작한다.
    3. ** 일 경우 끝 점을 찾아 색사을 변경한다.
 */