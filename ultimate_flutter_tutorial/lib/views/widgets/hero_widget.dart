import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero1", // identificador de pares Hero
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          "assets/images/bg.jpg",
          color: Colors.teal,
          colorBlendMode: BlendMode.darken,
        ),
      ),
    );
  }
}
