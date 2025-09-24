import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ocultar banner de debug
      // Tema do app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal, // cor usada como base
          brightness: Brightness.dark, // aplicar esquema de cores escuro
        ),
      ),
      // Página inicial do app
      home: Scaffold(),
    );
  }
}
