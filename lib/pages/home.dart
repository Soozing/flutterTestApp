import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/models/category.dart';
import 'package:testapp/models/diet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [];
  List<Diet> diets = [];

  void _getStates() {
    categories = Category.getCategories();
    diets = Diet.getDiets();
  }

  @override
  void initState() {
    // super.initState();
    _getStates();
  }

  @override
  Widget build(BuildContext context) {
    _getStates();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBar(),
          const SizedBox(
            height: 40,
          ),
          CategoryView(categories: categories),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommendation for Diet',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 240,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: diets.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 25,
                          ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: diets[index].boxColor,
                              borderRadius: BorderRadius.circular(25)),
                          width: 210,
                          child: Text(diets[index].name),
                        );
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            // color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 37,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              // color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 120,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: const EdgeInsets.only(
                // left: 20,
                right: 20,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: categories[index].boxColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        width: 50,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        )
      ]),
      margin: const EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(
                    color: Colors.black,
                    indent: 10.0,
                    endIndent: 10.0,
                    thickness: 0.4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset("assets/icons/filter.svg"),
                  ),
                ],
              ),
            ),
          ),
          hintText: "Search...",
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
