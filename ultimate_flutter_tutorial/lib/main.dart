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
        // Conteúdo do layout mobile
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
        floatingActionButton: Column(
          spacing: 10.0,
          mainAxisSize: MainAxisSize
              .min, // evitar que ícones sejam empurrados fora do canto superior
          children: [
            // FAB 1
            FloatingActionButton(
              child: Icon(Icons.edit_rounded),
              onPressed: () {
                // TODO: ação do FAB
              },
            ),
            // FAB 2
            FloatingActionButton(
              child: Icon(Icons.add_rounded),
              onPressed: () {
                // TODO: ação do FAB
              },
            ),
          ],
        ),
        drawer: SafeArea(
          child: Drawer(
            child: Column(children: [ListTile(title: Text("Logout"))]),
          ),
        ),
      ),
    );
  }
}
