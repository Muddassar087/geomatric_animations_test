import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geomatric_animations_test/airplane_animation/airplane_animation.dart';
import 'package:geomatric_animations_test/hero_animation/home.dart';
import 'package:geomatric_animations_test/tab_animations/tab_animation.dart';

class StartingPoint extends StatelessWidget {
  const StartingPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geomatric Animations"),
        elevation: 6.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const HomeWidget(),
                  ));
            },
            child: const Text("Hero demo"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const AirPlaneAnimation(),
                  ));
            },
            child: const Text("Airplane Ticket question"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const TabAnimations(),
                  ));
            },
            child: const Text("Tab fluid animations"),
          )
        ],
      ),
    );
  }
}
