import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Ponto de entrada da aplicação.
/// Chama o método runApp, que inicializa o Flutter e inflama o wid  raiz.
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: MyHomePage(), // chamar widget da página inicial
      ),
    );
  }
}

// ChangeNotifier: notifica ouvintes sobre mudanças de estado
/// Classe que mantém o estado da aplicação.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random(); // gerar nome aleatório

  /// Método que gera um novo nome aleatório
  void getNext() {
    current = WordPair.random();
    notifyListeners(); // notificar ouvintes sobre a mudança para atualizar UI
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Acessar o estado da aplicação
    var pair = appState.current; // Par de palavras atual

    // Scaffold: estrutura básica de layout visual
    return Scaffold(
      // centralizar elementos no meio da tela
      body: Center(
        // layout em coluna
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text('Nome aleatório gerado:'),
            // exibir par de nomes gerado:
            BigCard(pair: pair),
            // Botão
            ElevatedButton(
              onPressed: () {
                // Função chamada ao pressionar o botão
                appState.getNext(); // gerar novo nome
              },
              // Conteúdo do botão
              child: Text("Próximo"),
            ),
          ],
        ),
      ),
    );
  }
}

/// Card com texto em destaque.
class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // obter tema atual
    // Estilo do texto
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary, // cor legível na cor primária
      fontSize: 24, // tamanho da fonte
    );

    return Card(
      color: theme.colorScheme.primary, // background do card: cor primária
      child: Padding(
        padding: const EdgeInsets.all(20), // espaçamento ao redor do card
        child: Text(
          pair.asPascalCase,
          style: style,
          semanticsLabel:
              "${pair.first} ${pair.second}", // rótulo para leitores de tela
        ),
      ),
    );
  }
}
