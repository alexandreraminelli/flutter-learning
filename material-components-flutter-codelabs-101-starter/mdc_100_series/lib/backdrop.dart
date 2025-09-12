import "package:flutter/material.dart";
import "package:shrine/colors.dart";

import "model/product.dart";

// TODO: Add velocity constant (104)

/// Widget com estado que implementa o layout de fundo (backdrop).
class Backdrop extends StatefulWidget {
  final Category currentCategory;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  // Construtor
  const Backdrop(
      {
      // Tornar atributos obrigatórios
      // required -> não tem valor padrão e não podem ser null
      required this.currentCategory,
      required this.frontLayer,
      required this.backLayer,
      required this.frontTitle,
      required this.backTitle,
      Key? key // chave opcional
      })
      : super(key: key);

  @override
  _BackdropState createState() => _BackdropState();
}

// TODO: Add _FrontLayer class (104)
/// Widget que representa a camada da frente (front layer).
class _FrontLayer extends StatelessWidget {
  // TODO: Add on-tap callback (104)
  const _FrontLayer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(46)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // TODO: Add a GestureDetector (104)
          Expanded(child: child)
        ],
      ),
    );
  }
}

// TODO: Add _BackdropTitle class (104)

// TODO: Add _BackdropState class (104)
/// Classe de estado do widget Backdrop
class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: "Backdrop");

  // TODO: Add AnimationController widget (104)

  // TODO: Add BuildContext and BoxConstraints parameters to _buildStack (104)
  /// Constrói o layout em pilha (stack).
  Widget _buildStack() {
    // TODO: Create a RelativeRectTween Animation (104)

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        // TODO: Wrap backLayer in an ExcludeSemantics widget (104)
        widget.backLayer, // conteúdo do fundo
        // TODO: Add a PositionedTransition (104)
        // TODO: Wrap front layer in _FrontLayer (104)
        _FrontLayer(child: widget.frontLayer), // conteúdo da frente
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0.0,
      titleSpacing: 0.0,
      backgroundColor: kShrinePink100,
      // TODO: Replace leading menu icon with IconButton (104)
      // TODO: Remove leading property (104)
      // TODO: Create title with _BackdropTitle parameter (104)
      leading: Icon(Icons.menu_rounded),
      title: Text("SHRINE"),
      actions: <Widget>[
        // TODO: Add shortcut to login screen from trailing icons (104)

        // Botão de pesquisa
        IconButton(
            icon: const Icon(
              Icons.search_rounded,
              semanticLabel: "pesquisa",
            ),
            onPressed: () {
              // TODO: Add open login (104)
            }),
        // Botão de filtro
        IconButton(
          icon: const Icon(
            Icons.tune_rounded,
            semanticLabel: "filtro",
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      // TODO: Return a LayoutBuilder widget (104)
      body: _buildStack(),
    );
  }
}
