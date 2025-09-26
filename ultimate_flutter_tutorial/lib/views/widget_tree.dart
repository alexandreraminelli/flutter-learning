import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/views/pages/home_page.dart';
import 'package:ultimate_flutter_tutorial/views/pages/profile_page.dart';
import 'package:ultimate_flutter_tutorial/widgets/navbar_widget.dart';

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

      body: pages.elementAt(0),

      bottomNavigationBar: NavbarWidget(),
    );
    ;
  }
}
