import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_animate/flutter_animate.dart';

class AirplaneIcon extends StatelessWidget {
  const AirplaneIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: math.pi,
          child: const Icon(
            Icons.airplanemode_active,
            color: Colors.white,
            size: 54,
          ),
        ),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            shape: BoxShape.circle,
          ),
        ).animate().fadeOut(
              duration: const Duration(seconds: 1),
              delay: const Duration(milliseconds: 500),
              curve: Curves.fastEaseInToSlowEaseOut,
            )
      ],
    ).animate().custom(
      builder: (context, value, child) {
        double v = math.sin(value * math.pi / 2);

        return AnimatedPositioned(
          duration: const Duration(seconds: 2),
          curve: Curves.fastEaseInToSlowEaseOut,
          top: (height / 1.8) - (v * (height / 2)),
          left: (width / 1.7) - (v * (width / 2)),
          child: AnimatedScale(
            duration: const Duration(seconds: 1),
            curve: Curves.fastEaseInToSlowEaseOut,
            scale: (2 - v),
            child: child,
          ),
        );
      },
    );
  }
}

class ArrowsIcons extends StatelessWidget {
  const ArrowsIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(21.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.arrow_downward,
              color: Color(0xff5430FD),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(
        duration: const Duration(milliseconds: 500),
        delay: const Duration(seconds: 1));
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      height: height * .80,
      margin: EdgeInsets.only(left: ((width / 1.7) - ((width / 2))) + 39),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.white38,
          ),
        ),
      ),
    ).animate().fadeIn(
        duration: const Duration(milliseconds: 500),
        delay: const Duration(seconds: 2));
  }
}

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.textStyle,
    required this.text,
    this.target = false,
  });

  final TextStyle textStyle;
  final String text;
  final bool target;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Dot(),
        const SizedBox(width: 32),
        Expanded(
          child: TextOption(text: text, textStyle: textStyle),
        ),
      ],
    )
        .animate(
          target: target ? 1 : 0,
        )
        .fade(
          delay: const Duration(seconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: const Duration(milliseconds: 1),
          begin: 0,
          end: 1,
        )
        .moveY(
          duration: const Duration(seconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut,
          begin: 100,
          end: 0,
        );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 8,
    );
  }
}

class TextOption extends StatelessWidget {
  const TextOption(
      {super.key,
      required this.textStyle,
      required this.text,
      this.target = false});

  final TextStyle textStyle;
  final String text;
  final bool target;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
