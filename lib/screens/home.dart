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
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                _controller.animateTo(0.1, // Go to the minimum size
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: ListenWiget(),
            ),
            DraggableScrollableSheet(
              controller: _controller,
              minChildSize: 0.1,
              initialChildSize: 0.1,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(252, 252, 252, 1),
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
                            SizedBox(height: 20),
                            DetailWidget(),
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
      ),
    );
  }
}


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isListening = false;
//   bool isanalizing = false;

//   @override
//   Widget build(BuildContext context) {
//     final double mediaWidth = MediaQuery.of(context).size.width;
//     final double mediaHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(children: [
//         Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color.fromRGBO(255, 181, 63, 1),
//                 Color.fromRGBO(250, 169, 40, 1),
//               ],
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(isListening ? 'Hear-is가 듣는 중...' : '터치하여 Hear-is 시작하기!',
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600)),
//               const SizedBox(
//                 height: 40,
//               ),
//               AvatarGlow(
//                 animate: isListening,
//                 endRadius: 180.0,
//                 duration: const Duration(milliseconds: 2000),
//                 curve: Curves.easeInOut,
//                 child: GestureDetector(
//                   onTap: () => setState(() {
//                     isListening = !isListening;
//                   }),
//                   child: Material(
//                     shape: const CircleBorder(),
//                     elevation: 8,
//                     child: Container(
//                       padding: const EdgeInsets.all(15),
//                       height: 150,
//                       width: 150,
//                       decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Color.fromRGBO(255, 195, 99, 0.853)),
//                       child: SvgPicture.asset(
//                         'assets/icons/baby-smile-white.svg',
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         DraggableScrollableSheet(
//           initialChildSize: 0.30,
//           minChildSize: 0.15,
//           builder: (BuildContext context, ScrollController scrollController) {
//             return SingleChildScrollView(
//               controller: scrollController,
//               child: Text('Hello world'),
//             );
//           },
//         ),
//       ]),
//     );
//   }
// }
