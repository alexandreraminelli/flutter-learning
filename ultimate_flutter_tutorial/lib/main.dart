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
          title: Text("Flutter App"), // Título da página
          centerTitle: true,
        ),
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
          selectedIndex: 0, // índice atual
          // Função chamada ao selecionar um destino
          // value: índice do destino selecionado
          onDestinationSelected: (int value) {
            // TODO: navegação entre as páginas
          },
        ),
      ),
    );
  }
}
