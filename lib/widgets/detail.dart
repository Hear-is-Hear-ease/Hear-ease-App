import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/widgets/empty_detail.dart';

class DetailWidget extends StatefulWidget {
  final BabyState? babyState;
  const DetailWidget({super.key, required this.babyState});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.85;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height,
      child: widget.babyState == null
          ? const EmptyDetail()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                  width: width * 0.82,
                  height: 159,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.54),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(210, 243, 251, 0.54),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              width: 110,
                              height: 104,
                              child: Image.asset(
                                  'assets/icons/baby-diaper-color.png'),
                            ),
                            Text('새 기저귀가 필요해요!',
                                style: TextStyle(
                                  color: Color.fromRGBO(57, 141, 147, 1),
                                  fontSize: 15,
                                )),
                          ],
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.start,
                          spacing: 5,
                          children: [
                            Text('아이가 불안해 보이는',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('표정을 짓거나 졸린듯',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('눈을 게슴츠레',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('뜨고 있지는 않나요?',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Text('Diaper',
                    style: TextStyle(
                      fontSize: 30,
                    )),
                SizedBox(height: 22),
                SizedBox(
                  width: width * 0.82,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Diaper',
                            style: TextStyle(
                              fontSize: 17,
                            )),
                        Row(
                          children: [
                            Container(
                              height: 18,
                              width: width * 0.45,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(222, 252, 185, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3.0),
                                  bottomLeft: Radius.circular(3.0),
                                ),
                              ),
                            ),
                            Container(
                              height: 18,
                              width: width * 0.15,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(217, 217, 217, 0.5),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(3.0),
                                  bottomRight: Radius.circular(3.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: width * 0.82,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Diaper',
                            style: TextStyle(
                              fontSize: 17,
                            )),
                        Row(
                          children: [
                            Container(
                              height: 18,
                              width: width * 0.32,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 239, 199, 1),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3.0),
                                  bottomLeft: Radius.circular(3.0),
                                ),
                              ),
                            ),
                            Container(
                              height: 18,
                              width: width * 0.28,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(217, 217, 217, 0.5),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(3.0),
                                  bottomRight: Radius.circular(3.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                SizedBox(height: 32),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Color.fromRGBO(255, 255, 255, 0.28),
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('아기가 우는 주요한',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(47, 199, 117, 0.99),
                          )),
                      SizedBox(height: 12),
                      Text('원인 중 하나는 아기 기저귀의 상태가',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(47, 199, 117, 0.99),
                          )),
                      SizedBox(height: 12),
                      Text('좋지 않을 때에요!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(47, 199, 117, 0.99),
                          )),
                      SizedBox(height: 12),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '기저귀가 ',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(47, 199, 117, 0.99))),
                        TextSpan(
                            text: '젖어',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(57, 141, 147, 1))),
                        TextSpan(
                            text: '불편하다는 신호입니다.',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(47, 199, 117, 0.99))),
                      ])),
                      SizedBox(height: 20),
                      Text('아기가 쾌적함을 느낄 수 있게 기저귀를',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(47, 199, 117, 0.99),
                          )),
                      Text('갈아주는 것을 추천합니다.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(47, 199, 117, 0.99),
                          )),
                      SizedBox(height: 20),
                      Text('추가적으로 아기의 용변 상태와',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(47, 199, 117, 0.99),
                          )),
                      Text('기저귀 발진이 생기지 않았는지 확인해주세요.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(47, 199, 117, 0.99),
                          )),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
