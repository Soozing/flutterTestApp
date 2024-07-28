class Diet {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool isViewSelected;

  Diet({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.isViewSelected,
  });

  static List<Diet> _getDiets() {
    List<Diet> diets = [];

    diets.add(Diet(
      name: 'Honey Pancake',
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Easy',
      duration: '30 mins',
      calories: '180kCal',
      isViewSelected: true,
    ));

    diets.add(Diet(
      name: 'Canai Bread',
      iconPath: 'assets/icons/canai-bread.svg',
      level: 'Easy',
      duration: '20 mins',
      calories: '230kCal',
      isViewSelected: false,
    ));

    return diets;
  }
}
