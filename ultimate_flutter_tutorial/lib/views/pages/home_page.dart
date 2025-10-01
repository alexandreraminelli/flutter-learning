import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/container_widget.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            HeroWidget(title: "Flutter Mapp"), // imagem para animação
            // Cards
            ContainerWidget(
              title: "Basic Layout",
              description: "This is a description",
            ),
            ContainerWidget(
              title: "Basic Layout",
              description: "This is a description",
            ),
            ContainerWidget(
              title: "Basic Layout",
              description: "This is a description",
            ),
          ],
        ),
      ),
    );
  }
}
