import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          selectedPageNotifier, // variável que notifica o ouvinte quando houver uma mudança no seu valor
      builder: (context, selectedPage, child) {
        return NavigationBar(
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
          selectedIndex: selectedPage, // índice atual
          // Função chamada ao selecionar um destino
          // value: índice do destino selecionado
          onDestinationSelected: (int value) {
            // TODO: navegação entre as páginas
            selectedPageNotifier.value = value;
          },
        );
      },
    );
  }
}
