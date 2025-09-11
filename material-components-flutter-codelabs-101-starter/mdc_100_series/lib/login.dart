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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /* Controladores dos TextFields do formulário 
   * _ no início -> visibilidade privada 
  */
  /// Controlador do field username.
  final _usernameController = TextEditingController();

  /// Controlador do field password.
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                // Logo
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 120.0), // espaçamento
            // TODO: Remove filled: true values (103)

            // Field de username
            TextField(
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Nome de usuário',
                prefixIcon: Icon(Icons.person_rounded),
              ),
              controller: _usernameController,
            ),
            const SizedBox(height: 12.0), // espaçamento
            // Field de password
            TextField(
              obscureText: true, // ocultar texto
              decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.key_rounded)),
              controller: _passwordController,
            ),
            const SizedBox(height: 8), // espaçamento
            // Botões do form (em linha)
            OverflowBar(
              alignment: MainAxisAlignment.end, // alinhar à direita
              spacing: 8,
              children: <Widget>[
                // Botão Cancelar
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () {
                    /* Limpar os campos do form */
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                // Botão Próximo
                FilledButton(
                  child: const Text("Próximo"),
                  onPressed: () {
                    /* Avançar para a página inicial. */
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
