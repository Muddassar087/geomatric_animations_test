import 'package:flutter/material.dart';
import 'package:geomatric_animations_test/airplane_animation/page.dart';
import 'package:geomatric_animations_test/airplane_animation/widgets.dart';

class AirPlaneAnimation extends StatelessWidget {
  const AirPlaneAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff5430FD),
              Color(0xff8230C1),
            ],
          ),
        ),
        child: const Stack(
          children: [
            AirplaneIcon(),
            Align(
              alignment: Alignment.center,
              child: Line(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ArrowsIcons(),
            ),
            QuestionPage1()
          ],
        ),
      ),
    );
  }
}
