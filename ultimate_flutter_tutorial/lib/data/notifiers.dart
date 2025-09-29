import 'package:flutter/material.dart';

// Armazenar um valor que, ao ser atualizado, notificará os seus ouvintes
ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(true);
