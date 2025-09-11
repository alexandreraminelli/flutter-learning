// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      // Cabeçalho
      appBar: AppBar(
          // Cores
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          title: const Text("SHRINE"),
          // Botão de menu
          leading: IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              semanticLabel: "menu",
            ),
            onPressed: () {
              print("Menu Button");
            },
          ),
          // Botões de ação
          actions: <Widget>[
            // Botão de pesquisa
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                semanticLabel: "busca",
              ),
              onPressed: () {
                print("Search button");
              },
            ),
            // Botão de filtro
            IconButton(
              icon: const Icon(
                Icons.tune_rounded,
                semanticLabel: "filtro",
              ),
              onPressed: () {
                print("Filter button");
              },
            ),
          ]),

      // Conteúdo principal: grade de produtos
      body: GridView.count(
        crossAxisCount: 2, // número de colunas
        padding: const EdgeInsets.all(16),
        childAspectRatio: 8.0 / 9.0, // proporção dos cards
        // TODO: bUILD A GRID OF CARDS (102)
        children: const <Widget>[
          // Cards dos produtos
          Card(
            clipBehavior: Clip
                .antiAlias, // recortar conteúdo que ultrapassa os limites do card
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // alinhar texto ao start
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0, // proporção da imagem
                ),
                Padding(
                  // espaçamento do texto
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    // Título e texto secundário
                    children: <Widget>[
                      Text("Title"),
                      Text("Secondary Text"),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset:
          false, // desabilita o redimensionamento (evita que o teclado não mude o tamanho da página inicial)
    );
  }
}
