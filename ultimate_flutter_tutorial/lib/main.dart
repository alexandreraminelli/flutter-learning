import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/widgets/navbar_widget.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Conteúdo do layout mobile
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"), // Título da página
        centerTitle: true,
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
