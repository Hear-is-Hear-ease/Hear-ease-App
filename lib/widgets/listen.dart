import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/services/record.dart';
import 'package:path_provider/path_provider.dart';

class ListenWiget extends StatefulWidget {
  final Function(BabyState) onBabyStateUpdate;
  const ListenWiget({super.key, required this.onBabyStateUpdate});

  @override
  State<ListenWiget> createState() => _ListenWigetState();
}

class _ListenWigetState extends State<ListenWiget>
    with TickerProviderStateMixin {
  /*
  listenState가
  * init: 초기상태로 듣고 있지 않는 상태
  * listening: 
    - 음성을 듣고 있는 상태로 3초 단위로 음성을 듣고 적당히 잘라 2초로 구성하여 모델에 넣어 아기 소리인지 판단한다.
    - 임계치 이하의 소리는 무시한다.
  * silence: 임계치 이상의 소리가 들리지 않는 상태
  * crying: 아이의 울음소리가 지속적으로 감지되는 상태
  * analysing: crying 상태일 때 아이 음성을 통해 상태를 분석하는 단계
  * done: 분석이 완료된 상태로 7가지 상태 중 하나로 분석이 완료된 상황.
   */

  late AnimationController _circleController;
  late AnimationController _controller;
  late AnimationController _bounceController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _bounceAnimation;
  late SvgPicture mainSvg;
  late String listenState;

  late RecordService _record;
  bool isListening = false;

  @override
  void initState() {
    super.initState();

    _record = RecordService();
    _checkHasPermission();

    listenState = 'init';
    mainSvg = SvgPicture.asset('assets/icons/sound_wave-color.svg');

    _circleController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 250), // 0.05초 * 5 (원래 크기 -> 1.2배 -> 원래 크기)
    );

    _bounceAnimation =
        Tween<double>(begin: 1.0, end: 1.0).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.fastLinearToSlowEaseIn,
    ));

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.05).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _circleController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _checkHasPermission() async {
    if (await _record.checkHasPermission() == false) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("You must accept permissions"),
        duration: Duration(seconds: 5),
      ));
    }
  }

  String getMainSvgPath(String inputListenState) {
    String fileState = 'smile';
    switch (inputListenState) {
      case 'init':
        return 'assets/icons/sound_wave-color.svg';
      case 'listening':
        break;
      case 'silence':
        fileState = 'sleepy';
        break;
      case 'crying':
        fileState = 'uncomfortable';
        break;
      case 'analysing':
        return 'assets/icons/sound_analyzing-color.svg';
      case 'done':
        return 'assets/icons/check_circle-color.svg';
    }
    return 'assets/icons/baby-$fileState-white.svg';
  }

  String getTitle(String inputListenState) {
    switch (inputListenState) {
      case 'init':
        return '터치하여 Hear-is 시작하기!';
      case 'listening':
        return '아이의 울음소리에 귀를 기울이고 있어요';
      case 'silence':
        return '아기가 자고 있어요';
      case 'crying':
        return '아이가 울고 있어요!!';
      case 'analysing':
        return '아이의 울음 원인 분석 중!';
      case 'done':
        return '분석 완료!';
    }
    return '';
  }

  void setListenStateWithRef(String toListenState) {
    _controller.forward().then((_) {
      setState(() {
        listenState = toListenState;
        isListening = toListenState == 'listening';
        mainSvg = SvgPicture.asset(getMainSvgPath(listenState));
      });
      _controller.reverse().then((_) {
        _bounceController.forward().then((_) {
          _bounceController.reverse();
        });
      });
    });
  }

  void _waitSound() async {
    var dir = (await getApplicationDocumentsDirectory()).path;
    var filePath = '$dir/tempRecord.wav';
    bool hasDetected = await _record.waitSound(filePath, () => isListening);
    if (hasDetected && listenState == 'listening') {
      startAnalysing();
      _circleController.repeat(); // start circling
      _sendToServer(filePath);
    }
  }

  void _sendToServer(String filepath) {
    print("Send to server with file $filepath");
  }

  void toggleListening() {
    listenState == 'init' ? startListening() : endListening();
  }

  void startListening() {
    setListenStateWithRef('listening');
    _waitSound();
    // Future.delayed(const Duration(seconds: 4), () {
    //   bool isBabySound = true;
    // if (isBabySound && listenState == 'listening') {
    //   startAnalysing();
    //   _circleController.repeat(); // start circling
    // }
    // });
    // bool hasDone = await _waitSound();
  }

  void startAnalysing() {
    setListenStateWithRef('analysing');
    Future.delayed(const Duration(seconds: 4), () {
      String? predictState = 'sleepy';
      if (predictState != null) {
        setListenStateWithRef('done');
        _circleController.stop();
        Future.delayed(const Duration(seconds: 1, milliseconds: 400), () {
          var state = BabyState(state: 'hungry', predictMap: {
            'hungry': 0.72847,
            'sleepy': 0.18123,
            'hug': 0.05,
          });
          widget.onBabyStateUpdate(state);
        });
        Future.delayed(const Duration(seconds: 2), () {
          setListenStateWithRef('init');
        });
      }
    });
  }

  void endListening() {
    setListenStateWithRef('init');
    _circleController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     Color.fromRGBO(239, 187, 65, 1),
        //     Color.fromRGBO(251, 160, 35, 1),
        //   ],
        // ),
        color: Color.fromRGBO(255, 239, 199, 0.97),
      ),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(getTitle(listenState),
              style: const TextStyle(
                  color: Colors.black,
                  // color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              AvatarGlow(
                animate: ['listening', 'crying'].contains(listenState),
                endRadius: 160.0,
                glowColor: Colors.red.shade400,
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeInOut,
                child: GestureDetector(
                  onTap: toggleListening,
                  child: Material(
                    shape: CircleBorder(
                        // side: BorderSide(color: Colors.red.shade400),
                        ),
                    elevation: 8,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 199, 110, 0.851)),
                      child: Transform.scale(
                        scale: _scaleAnimation.value * _bounceAnimation.value,
                        child: mainSvg,
                      ),
                    ),
                  ),
                ),
              ),
              if (listenState == 'analysing')
                RotationTransition(
                  turns: _circleController,
                  child: CustomPaint(
                    painter: CircleHollowPainter(),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class CircleHollowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final innerCircle = Offset(size.width / 2, size.height / 2);
    final outerCircle = Offset(size.width / 2, size.height / 2);

    const innerRadius = 76.0;
    const outerRadius = 88.0;

    final outerPath = Path()
      ..addOval(Rect.fromCircle(center: outerCircle, radius: outerRadius));
    final innerPath = Path()
      ..addOval(Rect.fromCircle(center: innerCircle, radius: innerRadius));

    const gradient = SweepGradient(
      colors: [
        Color.fromRGBO(255, 219, 140, 0.851), // 더 밝은 주황색
        Color.fromRGBO(255, 100, 100, 0.851), // 붉은색
        Color.fromRGBO(255, 199, 110, 0.851), // 원래 배경색
        Color.fromRGBO(255, 150, 200, 0.851), // 핑크색
        Color.fromRGBO(235, 179, 90, 0.851), // 더 어두운 주황색
      ],
      stops: [0.0, 0.25, 0.5, 0.75, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(
          Rect.fromCircle(center: outerCircle, radius: outerRadius))
      ..style = PaintingStyle.fill;

    final holePath =
        Path.combine(PathOperation.difference, outerPath, innerPath);

    canvas.drawPath(holePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
