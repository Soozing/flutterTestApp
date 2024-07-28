import 'package:flutter/material.dart';

class Category {
  String name;
  String iconPath;
  Color boxColor;

  Category({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<Category> getCategories() {
    List<Category> categories = [];

    categories.add(Category(
      name: 'Salad',
      iconPath: 'assets/icons/plate.svg',
      boxColor: const Color.fromARGB(255, 249, 171, 218),
    ));
    categories.add(Category(
      name: 'Pancakes',
      iconPath: 'assets/icons/pancakes.svg',
      boxColor: const Color.fromARGB(255, 220, 177, 252),
    ));
    categories.add(Category(
      name: 'Pie',
      iconPath: 'assets/icons/pie.svg',
      boxColor: const Color.fromARGB(255, 140, 255, 209),
    ));
    categories.add(Category(
      name: 'Smoothies',
      iconPath: 'assets/icons/orange-snacks.svg',
      boxColor: const Color.fromARGB(255, 252, 155, 212),
    ));

    return categories;
  }
}
