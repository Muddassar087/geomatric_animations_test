import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:geomatric_animations_test/airplane_animation/widgets.dart';

class QuestionPage1 extends StatefulWidget {
  const QuestionPage1({super.key});

  @override
  State<QuestionPage1> createState() => _QuestionPage1State();
}

class _QuestionPage1State extends State<QuestionPage1> {
  bool numTarget = false;
  bool question = false;
  bool opt1 = false;
  bool opt2 = false;
  bool opt3 = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        numTarget = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 2100), () {
      setState(() {
        question = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 2200), () {
      setState(() {
        opt1 = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 2300), () {
      setState(() {
        opt2 = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 2400), () {
      setState(() {
        opt3 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Positioned(
      left: ((width / 1.7) - ((width / 2))) + 32,
      top: (height / 1.75) - (height / 2),
      child: SizedBox(
        width: width - (((width / 1.7) - ((width / 2))) + 80),
        height: height * .80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: TextOption(
                target: numTarget,
                text: "01",
                textStyle: const TextStyle(
                  fontSize: 64,
                  height: 1.0,
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              )
                  .animate(
                    target: numTarget ? 1 : 0,
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
                  ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: TextOption(
                text:
                    "Do you typically fly for buisness, personal or some other reasons",
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
                .animate(
                  target: question ? 1 : 0,
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
                ),
            const Spacer(),
            Option(
              target: opt1,
              text: "Business",
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            Option(
              target: opt2,
              text: "Personal",
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            Option(
              target: opt3,
              text: "Others",
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
