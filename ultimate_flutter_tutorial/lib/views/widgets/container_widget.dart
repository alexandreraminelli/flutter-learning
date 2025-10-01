import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/data/constants.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity, // w-full
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // alinhamento do conteúdo do card
            children: [
              Text(title, style: KTextStyle.titleTealText), // título
              Text(description, style: KTextStyle.descriptionText), // descrição
            ],
          ),
        ),
      ),
    );
  }
}
