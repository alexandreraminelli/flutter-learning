import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Ponto de entrada da aplicação.
/// Chama o método runApp, que inicializa o Flutter e inflama o widget raiz.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget root da aplicação
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      // usar Material Design
      child: MaterialApp(
        // Título da aplicação
        title: 'App de Nomes',
        theme: ThemeData(
          useMaterial3: true,
          // Esquema de cores
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(), // chamar widget da página inicial
      ),
    );
  }
}

// ChangeNotifier: notifica ouvintes sobre mudanças de estado
class MyAppState extends ChangeNotifier {
  var current = WordPair.random(); // gerar nome aleatório
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // Scaffold: estrutura básica de layout visual
    return Scaffold(
      // layout em coluna
      body: Column(
        children: [
          Text('\n\n\n\nA random AWESOME idea: Namer App'),
          Text(appState.current.asLowerCase), // exibir nome gerado
          // Botão
          ElevatedButton(
            // Função chamada ao pressionar o botão
            onPressed: () {
              print("Botão pressionado");
            },
            // Conteúdo do botão
            child: Text("Próximo"),
          ),
        ],
      ),
    );
  }
}
