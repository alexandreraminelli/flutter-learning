import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores do form
  TextEditingController controller = TextEditingController();

  /// Código executado ao iniciar a página (objeto adicionado na árvore)
  @override
  void initState() {
    // TODO: implement initState
    print("initState");
    super.initState();
  }
  /// Código executado ao sair da página (objeto removido da árvore permanentemente)
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            HeroWidget(title: "Login"), // header

            TextField(
              controller: controller,

              decoration: InputDecoration(border: OutlineInputBorder()),
              onEditingComplete: () => setState(() {}),
            ),
          ],
        ),
      ),
    );
  }
}
