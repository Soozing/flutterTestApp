import 'package:flutter/material.dart';

class Diet {
  String name;
  Color boxColor;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool isViewSelected;

  Diet({
    required this.name,
    required this.boxColor,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.isViewSelected,
  });

  static List<Diet> getDiets() {
    List<Diet> diets = [];

    diets.add(Diet(
      name: 'Honey Pancake',
      boxColor: const Color.fromARGB(255, 149, 254, 214),
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Easy',
      duration: '30 mins',
      calories: '180kCal',
      isViewSelected: true,
    ));

    diets.add(Diet(
      name: 'Canai Bread',
      boxColor: const Color.fromARGB(255, 149, 254, 214),
      iconPath: 'assets/icons/canai-bread.svg',
      level: 'Easy',
      duration: '20 mins',
      calories: '230kCal',
      isViewSelected: false,
    ));

    return diets;
  }
}
