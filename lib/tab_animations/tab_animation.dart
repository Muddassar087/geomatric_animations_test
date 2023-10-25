import 'package:flutter/material.dart';

class TabAnimations extends StatefulWidget {
  const TabAnimations({super.key});

  @override
  State<TabAnimations> createState() => _TabAnimationsState();
}

class _TabAnimationsState extends State<TabAnimations>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  double padding = 0;
  double imageAlignementValue = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              height: 400,
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  padding = customAnimation((notification.metrics.pixels /
                      notification.metrics.maxScrollExtent));

                  setState(() {});
                  return true;
                },
                child: TabBarView(
                  controller: controller,
                  children: [
                    Container(
                      height: 400,
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage("assets/lego_game.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        height: 100,
                        color: Colors.amber,
                      ),
                    ),
                    Container(
                      height: 400,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(left: padding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage("assets/lego_game.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  double customAnimation(double animationValue) {
    if (animationValue <= 0.5) {
      // Values increase from 1 to 100
      return (animationValue * 200) + 1;
    } else {
      // Values decrease from 100 to 97
      double adjustedValue =
          (animationValue - 0.5) * 2.0; // Adjust range to 0.0 to 1.0
      return (100 - adjustedValue * 100);
    }
  }
}
