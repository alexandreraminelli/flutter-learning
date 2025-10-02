import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ultimate_flutter_tutorial/views/widget_tree.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controladores do form
  TextEditingController controllerEmail = TextEditingController(text: "123");
  TextEditingController controllerPassword = TextEditingController(text: "456");

  // Credenciais de exemplo
  String confirmedEmail = "123";
  String confirmedPw = "456";

  /// Código executado ao iniciar a página (objeto adicionado na árvore)
  @override
  void initState() {
    super.initState();
  }

  /// Código executado ao sair da página (objeto removido da árvore permanentemente)
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return FractionallySizedBox(
                // fazer o filho ocupar 50% da width se o LayoutBuilder for maior que 500px
                widthFactor: constraints.maxWidth > 500 ? 0.5 : 1.0,

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Ilustração com animação
                      Lottie.asset("assets/lotties/home.json", height: 300.0),

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
                          onLoginPressed();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 40.0), // w-full
                        ),
                        child: Text("Entrar"),
                      ),
                      SizedBox(height: 50.0),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Função que realiza o login.
  void onLoginPressed() {
    if (confirmedEmail == controllerEmail.text &&
        confirmedPw == controllerPassword.text) {
      // Se e-mail e senha estão corretos
      // limpar pilha de navegação e ir pra Home
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
    } else {
      // Credenciais incorretas
      print("Incorreto");
    }
  }
}
