import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ultimate_flutter_tutorial/data/constants.dart';
import 'package:ultimate_flutter_tutorial/data/notifiers.dart';
import 'package:ultimate_flutter_tutorial/views/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  /// Obter e aplicar o tema salvo (se existir).
  void initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(KConstants.themeModeKey);
    isDarkModeNotifier.value = repeat ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // ocultar banner de debug
          // Tema do app
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal, // cor usada como base
              brightness: isDarkMode
                  ? Brightness.dark
                  : Brightness.light, // dark ou light mode
            ),
          ),
          // Página inicial do app
          home: WelcomePage(),
        );
      },
    );
  }
}
