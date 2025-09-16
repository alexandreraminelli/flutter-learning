import 'package:flutter/material.dart';

/// Modelo de dados para categorias
class CategoryModel {
  // Parâmetros
  String name;
  String iconPath;
  Color boxColor;

  // Construtor
  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  /// Retorna a lista de categorias.
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/plate.svg',
        boxColor: Color(0xff9DCEFF),
      ),
      CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color(0xffEEA4CE),
      ),
      CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color(0xff9DCEFF),
      ),
      CategoryModel(
        name: 'Smoothies',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: Color(0xffEEA4CE),
      ),
    ];
    return categories;
  }
}
