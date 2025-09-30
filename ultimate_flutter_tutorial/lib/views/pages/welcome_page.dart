import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/views/widget_tree.dart';

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
            // Cantos arredondados iguais
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset("assets/images/bg.jpg"),
            ),
            // Cantos arredondados diferentes
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(60),
              ),
              child: Image.asset("assets/images/bg.jpg"),
            ),

            // Botão pra página inicial
            FilledButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WidgetTree()),
              ),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
