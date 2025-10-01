import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ultimate_flutter_tutorial/data/constants.dart';
import 'package:ultimate_flutter_tutorial/views/pages/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ilustração com animação
                Lottie.asset("assets/lotties/hi.json", height: 300.0),

                Text(
                  "Flutter Mapp is the way to learn Flutter, period.",
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),

                // Botão de próxima etapa
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
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0), // w-full
                  ),
                  child: Text(title),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
