import "package:flutter/material.dart";

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
      ),
    );
  }
}
