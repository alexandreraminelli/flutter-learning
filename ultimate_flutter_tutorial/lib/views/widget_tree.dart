import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/data/notifiers.dart';
import 'package:ultimate_flutter_tutorial/views/pages/home_page.dart';
import 'package:ultimate_flutter_tutorial/views/pages/profile_page.dart';
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
