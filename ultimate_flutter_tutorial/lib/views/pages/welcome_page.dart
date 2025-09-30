import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
            // Ilustração com animação
            Lottie.asset("assets/lotties/welcome.json"),
            // Nome do app
            Text(
              "Flutter Mapp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                letterSpacing: 50.0,
              ),
            ),
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
