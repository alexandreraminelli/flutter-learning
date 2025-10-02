import 'package:flutter/material.dart';
import 'package:ultimate_flutter_tutorial/data/notifiers.dart';
import 'package:ultimate_flutter_tutorial/views/pages/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // Imagem de avatar
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage("assets/images/bg2.jpg"),
          ),

          // Botão de logout
          ListTile(
            title: Text("Logout"),
            onTap: () {
              selectedPageNotifier.value = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
