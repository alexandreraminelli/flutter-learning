import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /// Controlador pro TextField
  TextEditingController controller = TextEditingController();

  /// Valor do checkbox
  bool? isChecked = false;

  /// Valor do switch
  bool isSwitched = false;

  /// Valor do slider
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Input
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onEditingComplete: () => setState(() {}),
            ),
            // Output
            Text(controller.text),

            // Checkbox Simples
            Checkbox.adaptive(
              tristate: true, // 3º estado (indeterminado/null)
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            ),
            // Lista de Checkboxes
            CheckboxListTile.adaptive(
              tristate: true, // 3º estado (indeterminado/null)
              title: Text("Clique em Mim"),
              value: isChecked,
              onChanged: (bool? value) => setState(() {
                isChecked = value;
              }),
            ),

            Switch.adaptive(
              value: isSwitched,
              onChanged: (value) => setState(() {
                isSwitched = value;
              }),
            ),

            SwitchListTile.adaptive(
              title: Text("Switch Title"),
              subtitle: Text("Switch Subtitle"),
              value: isSwitched,
              onChanged: (value) => setState(() {
                isSwitched = value;
              }),
            ),

            Slider.adaptive(
              value: sliderValue,
              max: 100.0,
              divisions: 10, // limitar valores do slider a serem múltiplos de D
              onChanged: (double value) => setState(() {
                sliderValue = value;
              }),
            ),
            Text(sliderValue.toString()), // valor do Slider
            //

            // Widget clicável
            GestureDetector(
              child: Image.asset("assets/images/bg.jpg"),
              // Função ao clicar no Widget
              onTap: () {
                print("image selected");
              },
            ),
          ],
        ),
      ),
    );
  }
}
