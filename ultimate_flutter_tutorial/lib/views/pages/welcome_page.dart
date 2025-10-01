import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ultimate_flutter_tutorial/views/pages/login_page.dart';
import 'package:ultimate_flutter_tutorial/views/widget_tree.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ilustração com animação
            Lottie.asset("assets/lotties/welcome.json"),
            // Nome do app
            FittedBox(
              child: Text(
                "Flutter Mapp",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  letterSpacing: 50.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Botão de login
            FilledButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              ),
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0), // w-full
              ),
              child: Text("Entrar"),
            ),
            SizedBox(height: 8.0),
            // Botão de criar conta
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WidgetTree();
                  },
                ),
              ),
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0), // w-full
              ),
              child: Text("Criar Conta"),
            ),
          ],
        ),
      ),
    );
  }
}
