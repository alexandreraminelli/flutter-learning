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
import "package:intl/intl.dart"; // formatação de moeda

import "model/product.dart"; // modelo de produto
import "model/products_repository.dart"; // repositório de produtos

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  /// Função privada que retorna a lista de cards da página inicial.
  List<Card> _buildGridCards(BuildContext context) {
    // Carregar os produtos de todas as categorias
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[]; // retornar lista vazia se não houver produtos
    }

    /// Tema atual
    final ThemeData theme = Theme.of(context);

    /// Formatação de moeda local
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products
        .map(
          (product) => Card(
            /* Card de produto */
            clipBehavior: Clip
                .antiAlias, // recortar conteúdo que ultrapassa os limites do card
            // TODO: Adjust card heights (103)
            child: Column(
              // TODO: Center items on the card (103)
              crossAxisAlignment:
                  CrossAxisAlignment.start, // alinhar texto ao start
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 18.0 / 11.0, // proporção da imagem
                    child: Image.asset(
                      product.assetName, // caminho da imagem
                      package: product.assetPackage, // pacote da imagem
                      fit: BoxFit.fitWidth, // ajustar largura da imagem
                    )),
                Padding(
                  // espaçamento do texto
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: <Widget>[
                      // Nome do produto
                      Text(
                        product.name,
                        style: theme.textTheme.labelLarge,
                        softWrap: false, // não quebrar linha
                        overflow: TextOverflow.ellipsis, // ellipsis se vazar
                        maxLines: 1,
                      ),
                      // Preço
                      Text(
                        formatter.format(product.price),
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
        .toList();
  }

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
        children: _buildGridCards(context), // lista de cards
      ),
      resizeToAvoidBottomInset:
          false, // desabilita o redimensionamento (evita que o teclado não mude o tamanho da página inicial)
    );
  }
}
