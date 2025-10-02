import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1º Expanded, depois Flexible
            Row(
              children: [
                // Ocupa 4/6 da largura (independente dos filhos)
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.teal,
                    height: 100.0,
                    child: Text("Hello"),
                  ),
                ),
                // Ocupa somente espaço para o filho
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.orange,
                    height: 100.0,
                    child: Text("Hello"),
                  ),
                ),
              ],
            ),
            Divider(),
            // 1º Flexible, depois Expanded
            Row(
              children: [
                Flexible(
                  child: Container(
                    color: Colors.teal,
                    height: 100.0,
                    child: Text("Hello"),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orange,
                    height: 100.0,
                    child: Text("Hello"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
