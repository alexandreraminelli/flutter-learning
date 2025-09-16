import "package:flutter/material.dart";
import "package:lucide_icons/lucide_icons.dart";

/// Página inicial do app
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Layout Scaffold
    return Scaffold(
      appBar: AppBar(
        // Aparência da AppBar
        backgroundColor: Colors.white,
        elevation: 0,
        // Título da página
        title: Text(
          "Breakfast",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // Botão de voltar
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            // quadrado com background ao redor (parecer um botão)
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(LucideIcons.chevronLeft),
        ),
      ),
    );
  }
}
