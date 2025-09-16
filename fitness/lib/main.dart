import 'package:fitness/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // ponto de entrada da aplicação
}

/// Widget Raiz da aplicação
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins', // fonte padrão do app
      ),
      debugShowCheckedModeBanner: false, // remover faixa de "debug"
      home: HomePage(), // Página inicial da aplicação
    );
  }
}
