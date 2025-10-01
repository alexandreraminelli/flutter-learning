import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ultimate_flutter_tutorial/views/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ilustração com animação
                Lottie.asset("assets/lotties/welcome.json", height: 400.0),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: "Login");
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0), // w-full
                  ),
                  child: Text("Entrar"),
                ),
                SizedBox(height: 8.0),
                // Botão de criar conta
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: "Criar Conta");
                        },
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0), // w-full
                  ),
                  child: Text("Criar Conta"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
