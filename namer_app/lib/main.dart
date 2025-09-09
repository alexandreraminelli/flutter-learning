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

  /// Atributo com array de nomes favoritos
  var favorites = <WordPair>[];

  /// Método que adiciona ou remove um par de nomes dos favoritos
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners(); // atualizar UI
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _ (underscore): classe privada
/// Estado do widget MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  /// Índice do item selecionado na barra de navegação
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage(); // página de gerar nomes
      case 1:
        page = Placeholder(); // página de favoritos (a implementar)
      default:
        throw UnimplementedError("Nenhum widget para o índice $selectedIndex");
    }

    return Scaffold(
      body: Row(
        children: [
          // Barra de navegação lateral
          SafeArea(
            child: NavigationRail(
              extended: false, // estendida: mostrar apenas ícones
              destinations: [
                NavigationRailDestination(
                  // gerador
                  icon: Icon(Icons.home_rounded),
                  label: Text("Início"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_rounded),
                  label: Text("Favoritos"),
                ),
              ], // lista de itens de navegação
              selectedIndex: selectedIndex, // Página atual
              // Função chamada ao selecionar um item:
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value; // atualizar índice selecionado
                });
              },
            ),
          ),
          // Área principal
          // Expanded: widget que expande para preencher espaço disponível
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page, // exibir página selecionada
            ),
          ),
        ],
      ),
    );
  }
}

/// Página de gerar nomes.
class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>(); // Acessar o estado da aplicação
    var pair = appState.current; // Par de palavras atual

    /// Ícone do botão Favoritos
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    // Scaffold: estrutura básica de layout visual
    return Center(
      // layout em coluna
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          // exibir par de nomes gerado:
          BigCard(pair: pair),
          // Botões das palavras
          Row(
            mainAxisSize: MainAxisSize.min, // size: fit-content
            spacing: 14,
            children: [
              // Botão Favoritar
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text("Favorito"),
              ),
              // Botão Próximo
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
        ],
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
