import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/data/notifiers.dart';
import 'package:ultimate_flutter_tutorial/views/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // ocultar banner de debug
          // Tema do app
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal, // cor usada como base
              brightness: isDarkMode
                  ? Brightness.dark
                  : Brightness.light, // dark ou light mode
            ),
          ),
          // Página inicial do app
          home: WelcomePage(),
        );
      },
    );
  }
}
