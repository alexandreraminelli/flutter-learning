import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/data/constants.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          HeroWidget(), // imagem para animação
          // Cards
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity, // w-full
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // alinhamento do conteúdo do card
                  children: [
                    Text(
                      "Basic Layout",
                      style: KTextStyle.titleTealText,
                    ), // título
                    Text(
                      "Description",
                      style: KTextStyle.descriptionText,
                    ), // descrição
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
