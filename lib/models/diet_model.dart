
import 'package:flutter/material.dart';

class DietModel{
  String name;
  String iconPath;
  Color color;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
    required this.color
  });

  static List<DietModel> getDiets(){
    List<DietModel> diets=[];

    diets.add(
      DietModel(name: "Honey PanCake", iconPath: "assets/icons/honeyPancakeIcon.svg", level: "Easy", duration: "30 mins", calorie: "180kcal", viewIsSelected: true, color: const Color.fromARGB(255, 118, 144, 119))
    );

    diets.add(
      DietModel(name: "Honey PanCake", iconPath: "assets/icons/honeyPancakeIcon.svg", level: "Easy", duration: "30 mins", calorie: "180kcal", viewIsSelected: true, color: const Color.fromARGB(255, 179, 119, 189),)
    );

    diets.add(
      DietModel(name: "Honey PanCake", iconPath: "assets/icons/honeyPancakeIcon.svg", level: "Easy", duration: "30 mins", calorie: "180kcal", viewIsSelected: true, color: const Color.fromARGB(255, 238, 187, 110))
    );
    return diets;
  }
}