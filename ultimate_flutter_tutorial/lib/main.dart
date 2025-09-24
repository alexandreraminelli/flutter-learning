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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,

          // Título da página
          title: Text("Flutter App"),
          centerTitle: false,
          // Botão principal
          leading: Icon(Icons.login),
          // Botões de ação
          actions: [Text("efndsiejudfn"), Icon(Icons.login)],
        ),
      ),
    );
  }
}
