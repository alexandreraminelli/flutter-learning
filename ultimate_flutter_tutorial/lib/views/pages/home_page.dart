import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/data/constants.dart';
import 'package:ultimate_flutter_tutorial/views/pages/course_page.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/container_widget.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Lista de conteúdo dos cards
    List<String> list = [
      KValue.keyConcepts,
      KValue.cleanUi,
      KValue.fixBugs,
      KValue.basicLayout,
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            HeroWidget(title: "Flutter Mapp", nextPage: CoursePage()),
            SizedBox(height: 5.0),
            // Cards
            ...List.generate(
              list.length, // length (quant. de elementos)
              (index) {
                // generator (função que gera os Widgets)
                return ContainerWidget(
                  title: list[index],
                  description: "This is a description",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
