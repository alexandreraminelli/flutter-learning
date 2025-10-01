import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/views/pages/home_page.dart';
import 'package:ultimate_flutter_tutorial/views/widget_tree.dart';
import 'package:ultimate_flutter_tutorial/views/widgets/hero_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores do form
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

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
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeroWidget(title: "Login"), // header
            SizedBox(height: 20.0),

            // Campo de e-mail
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                // label: Text("E-mail"),
                hintText: "E-mail", // placeholder
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onEditingComplete: () => setState(() {}),
            ),
            SizedBox(height: 10.0),
            // Campo de senha
            TextField(
              controller: controllerPassword,
              decoration: InputDecoration(
                // label: Text("E-mail"),
                hintText: "Senha", // placeholder
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onEditingComplete: () => setState(() {}),
            ),
            SizedBox(height: 20.0),
            // Botão de Login
            FilledButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WidgetTree();
                    },
                  ),
                );
              },
              style: FilledButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0), // w-full
              ),
              child: Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}
