import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(name: "Salad", iconPath: "assets/icons/saladIcon.svg", boxColor: const Color.fromARGB(255, 112, 179, 235)),
    );

    categories.add(
      CategoryModel(name: "PanCake", iconPath: "assets/icons/pancakeIcon.svg", boxColor: const Color.fromRGBO(28, 182, 190, 1)),
    );

    categories.add(
      CategoryModel(name: "Pie", iconPath: "assets/icons/pieIcon.svg", boxColor: const Color.fromARGB(255, 202, 239, 100)),
    );

    categories.add(
      CategoryModel(name: "Smoothies", iconPath: "assets/icons/smoothyIcon.svg", boxColor: const Color.fromARGB(255, 223, 157, 243)),
    );

    return categories;
  }
}