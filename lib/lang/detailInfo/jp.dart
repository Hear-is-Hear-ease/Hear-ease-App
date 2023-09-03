import 'package:hear_ease_app/lang/detailInfo/lang.dart';
import 'package:hear_ease_app/models/detail_info.dart';

class DetailInfoJP extends DetailInfoLang {
  @override
  DetailInfo diaperInfo = DetailInfo(
    state: 'Diaper',
    predictionMap: {},
    iconPath: 'assets/icons/diaper.png',
    iconTitle: '新しいおむつが必要です！',
    iconDesc: '赤ちゃんが\n不安そう\nりしてい\nませんか？',
    description:
        '赤ちゃんが泣く主な理由の一つは、\n **おむつの状態**が不快な時です！\nつまり、おむつが**濡れていて**不\n便だというサインです 。\n\n赤ちゃんに快適さを提供するためにも、\n **おむつの交換**をお勧めします。\n\nさらに、赤ちゃんの**排泄状態**や\n **おむつかぶれ**の有無も確認しましょう。',
  );

  @override
  DetailInfo uncomfortableInfo = DetailInfo(
    state: 'Uncomfortable',
    predictionMap: {},
    iconPath: 'assets/icons/uncomfortable.png',
    iconTitle: '不便です！',
    iconDesc: '赤ちゃんの\n体温や行動を確認\nしてみましたか？',
    description:
        '赤ちゃんに熱もなく、\nお腹も硬くなければ\n赤ちゃんが**成長痛**を経験\nしている可能性があります！\n赤ちゃんの足をやさしく\n **マッサージ**してください。\n\nまたは、赤ちゃんの周りの\n環境が適していないかもしれませんので、\n **温度**や**湿度**をチェックしてみてください。\n一般的に、赤ちゃんが快適\nに感じる室内温度は**24~26度**、\n湿度は**50~60%**が最も\n理想的と言われています！',
  );

  @override
  DetailInfo sleepyInfo = DetailInfo(
    state: 'Sleepy',
    predictionMap: {},
    iconPath: 'assets/icons/sleepy.png',
    iconTitle: '眠いです！',
    iconDesc: '赤ちゃんが手を目に\n持って行ったり、\nずっと瞬きを\nしたりしますか？',
    description:
        'これは赤ちゃんが\n **眠くなっている**というサインです。\n\n赤ちゃんがよく眠れるよう、\n周りを**静かに**してあげてください。\n\n下のボタンを押すと、\n赤ちゃんの睡眠に役立つ\n **音楽**を提供いたします！',
  );

  @override
  DetailInfo sadInfo = DetailInfo(
    state: 'Sad',
    predictionMap: {},
    iconPath: 'assets/icons/sad.png',
    iconTitle: '悲しいです！',
    iconDesc: '赤ちゃんが\n明確な理由もなく\n泣いていますか？',
    description:
        'まずは、赤ちゃんの**体温**や**体調**を\n確認してみてください。\nもし赤ちゃんに熱があるなら、\n近くの病院をご案内します。.\n\nそれとは別に、赤ちゃんが**全身に力**を\n入れて顔が**真っ赤になったり**、\n拳を握りしめて**お腹に力**を\n入れたりする様子が見られるなら、\n **乳児疝痛**の可能性も考えられます！',
  );

  @override
  DetailInfo hugInfo = DetailInfo(
    state: 'Hug',
    predictionMap: {},
    iconPath: 'assets/icons/hug.png',
    iconTitle: '抱きしめてください！',
    iconDesc: '赤ちゃんが涙\nもなく大声で\n泣いていますか？',
    description:
        'それなら、赤ちゃんはもっと\n **抱きしめられたい**と訴えているか、\n遊びたがっているのかもしれません！\nこれは赤ちゃんが親との**交流**を\n求めている状態です。\n\n赤ちゃんを優しく抱きしめたり、\n **目を合わせて**一緒に遊ん\nだりしてみてください。\nこれは赤ちゃんとの**愛着形成**に役立ちます！',
  );

  @override
  DetailInfo awakeInfo = DetailInfo(
    state: 'Awake',
    predictionMap: {},
    iconPath: 'assets/icons/awake.png',
    iconTitle: '今起きたばかりです！',
    iconDesc: '赤ちゃんは自分の\n動きに驚いて\n目を覚まし泣\nくこともあります',
    description:
        '赤ちゃんを**優しく慰め**、\n安心できるように**包み**で暖か\nく包んであげてください。\n\n赤ちゃんがリラックスできる\n **音楽**を流すのはいかがでしょうか？',
  );

  @override
  DetailInfo hungryInfo = DetailInfo(
    state: 'Hungry',
    predictionMap: {},
    iconPath: 'assets/icons/hungry.png',
    iconTitle: 'お腹が空きました！',
    iconDesc: '首を回して\n手を見たり、\n指を吸ったり\nしますか？',
    description:
        'それなら、赤ちゃんはお腹が空いてい\nる可能性が高いです。\n **授乳**したり**ミルク**をあげてみてください！\n\nさらに、普段赤ちゃんがどのくらいの\n **間隔**で**食事**をするか確認してみましょう。\n\n赤ちゃんの食事時間に合わせて**アラーム** \nを設定してみるのはいかがでしょうか？',
  );
}
