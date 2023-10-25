import 'package:flutter/material.dart';
import 'package:geomatric_animations_test/hero_animation/game_details.dart';
import 'package:geomatric_animations_test/hero_animation/widgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameDetailsScreen(
                        heroTag: "gameCard",
                      ),
                    ),
                  );
                },
                child: const GameCard(
                  heroTag: "gameCard",
                  paddingTop: 0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameDetailsScreen(
                        heroTag: "gameCard2",
                      ),
                    ),
                  );
                },
                child: const GameCard(
                  heroTag: "gameCard2",
                  paddingTop: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard(
      {super.key,
      this.heroTag = '',
      this.paddingTop = 24,
      this.closeIcon = false,
      this.marginBottom = 24});

  final String heroTag;
  final double paddingTop;
  final bool closeIcon;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    double paddingCard = closeIcon ? 16 : 12;
    return Hero(
      tag: heroTag,
      flightShuttleBuilder: (flightContext, animation, flightDirection,
          fromHeroContext, toHeroContext) {
        return MainCard(
            paddingCard: paddingCard,
            closeIcon: closeIcon,
            paddingTop: paddingTop,
            marginBottom: marginBottom,
            animation: animation);
      },
      child: MainCard(
        paddingCard: paddingCard,
        closeIcon: closeIcon,
        paddingTop: paddingTop,
        marginBottom: marginBottom,
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.closeIcon,
    required this.paddingTop,
    required this.paddingCard,
    this.marginBottom = 24,
    this.animation,
  });

  final bool closeIcon;
  final double paddingTop;
  final double paddingCard;
  final double marginBottom;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 500,
      margin: EdgeInsets.only(bottom: marginBottom),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/lego_game.jpeg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        color: Colors.black26,
        padding: EdgeInsets.only(top: paddingTop),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// TITLE
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: paddingCard,
                    top: paddingCard,
                    right: paddingCard,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "APPLE ARCADE",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none),
                      ),
                      Visibility(
                        visible: closeIcon,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: paddingCard,
                    top: 8,
                    right: paddingCard,
                  ),
                  child: Text(
                    "Smash your rivals in LEGO Brawels",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none),
                  ),
                ),
              ],
            ),

            /// BOTTOM CONTAINER
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: Colors.grey[900],
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/lego_game.jpeg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "APPLE ARCADE",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  decoration: TextDecoration.none),
                        ),
                        Text(
                          "Today",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none),
                        ),
                        Text(
                          "Battle with friends online",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                  decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(122),
                    ),
                    child: Text(
                      "GET",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
