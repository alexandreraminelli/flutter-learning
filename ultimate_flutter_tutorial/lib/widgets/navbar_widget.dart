import 'package:flutter/material.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  /// Índice da página atual
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      // Lista de destinos do app
      destinations: [
        NavigationDestination(icon: Icon(Icons.home_rounded), label: "Início"),
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
    );
  }
}
