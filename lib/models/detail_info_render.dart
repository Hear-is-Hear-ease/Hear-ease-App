import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/models/detail_info.dart';

class DetailInfoRender {
  BabyState babyState;
  late DetailInfo _info;

  static DetailInfo diaperInfo = DetailInfo(
      state: 'Diaper',
      predictionMap: {},
      iconPath: 'assets/icons/diaper.png',
      iconTitle: '새 기저귀가 필요해요!',
      iconDesc: '아이가 불안해 보이는\n표정을 짓거나 졸린듯\n눈을 게슴츠레\n뜨고 있지는 않나요?',
      description:
          '아기가 우는 주요한\n원인 중 하나는 아기 기저귀의 상태가\n좋지 않을 때에요!\n기저귀가 **젖어** 불편하다는 신호입니다.\n\n아기가 쾌적함을 느낄 수 있게 기저귀를\n **갈아주는** 것을 추천합니다.\n\n추가적으로 아기의 **용변** 상태와\n기저귀 **발진**이 생기지 않았는지 확인해주세요.');

  static DetailInfo hungryInfo = DetailInfo(
      state: 'Hungry',
      predictionMap: {},
      iconPath: 'assets/icons/hungry.png',
      iconTitle: '배가 고파요!',
      iconDesc: '아기 입 주변에\n검지를 갖다 대보세요.\n혹시 고개를 돌려\n손을 보거나, 손을\n빠는 시늉을 하나요?',
      description:
          '그렇다면 아기는\n배가 고플 확률이 높으니\n **수유**를 하거나 **우유**를 주세요!\n\n추가적으로 평소 아기가\n **밥**을 먹는 시간이\n되었는지도 확인해주세요!\n\n아기가 밥 먹는 시간을 알려주는 **알람**을\n설정해 보는 건 어떨까요?');

  static DetailInfo awakeInfo = DetailInfo(
      state: 'Awake',
      predictionMap: {},
      iconPath: 'assets/icons/awake.png',
      iconTitle: '방금 일어났어요!',
      iconDesc: '자다가도 자신의\n움직임에 깜짝 놀라며\n잠에서 깨어 울기도 하죠.',
      description:
          '아기가 이제 막 일어났어요!\n아기를 잘 **다독여** 주시고,\n\n싸개로 아기를 **포근하게** 감싸주는 것이 좋아요.\n아기는 **포근하게** 감싸였을 때 안정감을\n느끼기 때문입니다.\n\n아기를 편안하게 해주는 **음악**을\n들려주는 것은 어떨까요?');

  static DetailInfo hugInfo = DetailInfo(
      state: 'Hug',
      predictionMap: {},
      iconPath: 'assets/icons/hug.png',
      iconTitle: '방금 일어났어요!',
      iconDesc: '아기가 눈물없이\n크게 울고 있나요?',
      description:
          '그렇다면 아기는 더 **안아달라**는 의미이거나\n놀고 싶다는 투정일 수 있어요!\n아이가 부모님의 **포옹**을\n원하는 상태입니다.\n\n아이를 안아 토닥여주거나\n아기의 울음에 **즉각적**으로 반응해주고 놀아줍시다.');

  static DetailInfo sadInfo = DetailInfo(
      state: 'Sad',
      predictionMap: {},
      iconPath: 'assets/icons/sad.png',
      iconTitle: '슬퍼요!',
      iconDesc: '혹시 아기가 뚜렷한\n원인 없이 막 우나요?',
      description:
          '먼저 아기의 **체온**이나 **몸 상태**를 체크해보세요.\n아기가 어딘가 이상이 있나요?\n최대한 빠르게 응급처치를 해주시고,\n가까운 병원도 안내할게요.\n\n그런게 아니라 아기가 **온몸**에 힘이 들어가\n얼굴이 **붉어지거나**,\n팔다리를 몸에 가까이 붙이고 **주먹**을 쥐면서\n배에 힘을 주고 있다면\n **영아 산통**을 의심해 볼 수 있어요!');

  static DetailInfo sleepyInfo = DetailInfo(
      state: 'Sleepy',
      predictionMap: {},
      iconPath: 'assets/icons/sleepy.png',
      iconTitle: '졸려요!',
      iconDesc: '아이가 손을 눈에\n가져가거나\n계속 눈을 깜빡이는지\n확인해주세요',
      description:
          '그렇다면 아기가\n **잠**이 온다는 의미에요.\n이 울음은  아이가 **졸리다**는 신호입니다.\n\n아기가 잘 잘 수 있도록\n준비를 해 두는게 좋겠죠?\n아이가 편안하게 휴식을 취할 수 있도록\n주변을 **조용하게** 만들어주세요.\n\n아래의 버튼을 누르면 아기의 수면에\n도움이 되는 **노래**를 제공해 드릴게요.');

  static DetailInfo uncomfortableInfo = DetailInfo(
      state: 'Uncomfortable',
      predictionMap: {},
      iconPath: 'assets/icons/uncomfortable.png',
      iconTitle: '어딘가 불편해요!',
      iconDesc: '아이가 손을 눈에\n가져가거나\n계속 눈을 깜빡이는지\n확인해주세요',
      description:
          '아기가 불편한 이유는\n여러 가지 이유가 있을 수 있어요!\n\n먼저 아기의 **기저귀** 상태를 확인해 주세요.\n\n또한 주변 환경의 여건이 맞지 않는 경우일 수 있으니,\n **온도**나 **습도**가 지나치게 높거나 낮은 것은\n아닌지 확인해주세요.\n방 안 온도는 **24~26도**,\n습도는 **50~60%**가 가장 적당하다고 해요!');

  DetailInfoRender({required this.babyState}) {
    switch (babyState.state.toLowerCase()) {
      case 'diaper':
        _info = diaperInfo;
        break;
      case 'hungry':
        _info = hungryInfo;
        break;
      case 'awake':
        _info = awakeInfo;
        break;
      case 'hug':
        _info = hugInfo;
        break;
      case 'sad':
        _info = sadInfo;
        break;
      case 'sleepy':
        _info = sleepyInfo;
        break;
      case 'uncomfortable':
        _info = uncomfortableInfo;
        break;
      default:
        throw "Unknown type of baby state";
    }
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

  // Column renderPredictionInfo(double width) {
  //   List<String> keys = babyState.predictMap.keys.toList();
  //   return Column(
  //     children: [
  //       SizedBox(
  //         width: width * 0.82,
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(keys[0],
  //               style: const TextStyle(
  //                 fontSize: 17,
  //               )),
  //           renderPredictBar(
  //               width: width * 0.5, percent: babyState.predictMap[keys[0]]!),
  //         ]),
  //       ),
  //       const SizedBox(height: 10),
  //       SizedBox(
  //         width: width * 0.82,
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(keys[1],
  //               style: const TextStyle(
  //                 fontSize: 17,
  //               )),
  //           renderPredictBar(
  //               width: width * 0.5,
  //               percent: babyState.predictMap[keys[1]]!,
  //               color: const Color.fromRGBO(255, 239, 199, 1)),
  //         ]),
  //       ),
  //     ],
  //   );
  // }

  // Row renderPredictBar({
  //   required double width,
  //   required double percent,
  //   Color color = const Color.fromRGBO(222, 252, 185, 1),
  // }) {
  //   if (percent > 1) {
  //     throw "percent in renderPredictBar must be less than 1";
  //   }
  //   return Row(
  //     children: [
  //       Container(
  //         height: 18,
  //         width: width * percent,
  //         decoration: BoxDecoration(
  //           color: color,
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(3.0),
  //             bottomLeft: Radius.circular(3.0),
  //           ),
  //         ),
  //       ),
  //       Container(
  //         height: 18,
  //         width: width * percent,
  //         decoration: const BoxDecoration(
  //           color: Color.fromRGBO(217, 217, 217, 0.5),
  //           borderRadius: BorderRadius.only(
  //             topRight: Radius.circular(3.0),
  //             bottomRight: Radius.circular(3.0),
  //           ),
  //         ),
  //       ),
  // //       Text('${(percent * 100).round()}%'),
  //     ],
  //   );
  // }

  SizedBox renderPredictionInfo(double width) {
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
                    width: width * 0.5 * p1,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(222, 252, 185, 1),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 15,
                      // width: width * 0.5 * (1 - p1),
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
                    width: width * 0.5 * p2,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 239, 199, 1),
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 15,
                      // width: width * 0.5 * (1 - p1),
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
    // return Column(
    //   children: [
    //     SizedBox(
    //       width: width * 0.82,
    //       child:
    //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text(keys[0],
    //             style: const TextStyle(
    //               fontSize: 17,
    //             )),
    //         renderPredictBar(
    //             width: width * 0.5, percent: babyState.predictMap[keys[0]]!),
    //       ]),
    //     ),
    //     const SizedBox(height: 10),
    //     SizedBox(
    //       width: width * 0.82,
    //       child:
    //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Text(keys[1],
    //             style: const TextStyle(
    //               fontSize: 17,
    //             )),
    //         renderPredictBar(
    //             width: width * 0.5,
    //             percent: babyState.predictMap[keys[1]]!,
    //             color: const Color.fromRGBO(255, 239, 199, 1)),
    //       ]),
    //     ),
    //   ],
    // );
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
