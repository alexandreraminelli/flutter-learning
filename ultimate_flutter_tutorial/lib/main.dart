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
  /// Índice da página atual
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Conteúdo do layout mobile
      appBar: AppBar(
        title: Text("Flutter App"), // Título da página
        centerTitle: true,
      ),

      body: Center(child: currentIndex == 0 ? Text("Início") : Text("Perfil")),

      bottomNavigationBar: NavigationBar(
        // Lista de destinos do app
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: "Início",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: "Perfil",
          ),
        ],
        selectedIndex: currentIndex, // índice atual
        // Função chamada ao selecionar um destino
        // value: índice do destino selecionado
        onDestinationSelected: (int value) {
          // Tornar destino selecionado o atual
          setState(() {
            currentIndex = value;
          });

          // TODO: navegação entre as páginas
        },
      ),
    );
  }
}
