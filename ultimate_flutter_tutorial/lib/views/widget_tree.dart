import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/data/notifiers.dart';
import 'package:ultimate_flutter_tutorial/views/pages/home_page.dart';
import 'package:ultimate_flutter_tutorial/views/pages/profile_page.dart';
import 'package:ultimate_flutter_tutorial/views/pages/settings_page.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/navbar_widget.dart';

/// Lista de páginas.
List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"), // Título da página
        centerTitle: true,

        actions: [
          // botão de tema (light ou dark)
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(
                  isDarkMode
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                );
              },
            ),
            onPressed: () {
              // Alterar tema da aplicação
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            tooltip: "Tema",
          ),
          // Botão de configurações
          IconButton(
            onPressed: () {
              // Navegar até página de configurações
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            icon: Icon(Icons.settings_rounded),
            tooltip: "Configurações",
          ),
        ],
      ),

      body: ValueListenableBuilder(
        // atualizar página selecionada (classe ValueNotifier)
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(
            selectedPage,
          ); // alternar entre as páginas da lista
        },
      ),

      bottomNavigationBar: NavbarWidget(),
    );
  }
}
