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

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ],
      ),
    );
  }
}
