import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_flutter_tutorial/data/constants.dart';
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
            onPressed: () async {
              // Alterar tema da aplicação
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              // Salvar no disco a preferência de tema
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.themeModeKey,
                isDarkModeNotifier.value,
              );
            },
            tooltip: "Tema",
          ),
          // Botão de configurações
          IconButton(
            onPressed: () {
              // Navegar até página de configurações
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(
                    title: "Configurações", // passar parâmetro da página
                  ),
                ),
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
