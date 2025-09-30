import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/views/widget_tree.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroWidget(), // imagem para animação
            // Botão pra página inicial
            FilledButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WidgetTree();
                  },
                ),
              ),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
