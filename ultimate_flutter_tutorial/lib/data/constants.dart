import 'package:flutter/material.dart';

class KConstants {
  // Nomes de chaves do SharedPreferences
  static const String themeModeKey = "themeModeKey";
}

/// Estilos de textos
class KTextStyle {
  /// Título na cor primária.
  static const TextStyle titleTealText = TextStyle(
    color: Colors.teal,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  /// Título de descrição.
  static const TextStyle descriptionText = TextStyle(fontSize: 16.0);
}

class KValue {
  static const String basicLayout = "Basic Layout";
  static const String cleanUi = "Clean UI";
  static const String fixBugs = "Fix Bugs";
  static const String keyConcepts = "Key Concepts";
}
