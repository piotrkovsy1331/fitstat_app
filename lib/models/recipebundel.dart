import 'package:flutter/material.dart';
import 'package:fitstat_app/shared/constants.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color;

  RecipeBundle(
      {this.id,
      this.chefs,
      this.recipes,
      this.title,
      this.description,
      this.imageSrc,
      this.color});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "Śniadanie",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/cook_new@2x.png",
    color: kBreakfastColor,
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "Lunch",
    description: "Cook recipes for special occasions",
    imageSrc: "assets/images/best_2020@2x.png",
    color: kLunchColor,
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Obiad",
    description: "What's your favorite food dish make it now",
    imageSrc: "assets/images/food_court@2x.png",
    color: kDinnerColor,
  ),
  RecipeBundle(
    id: 4,
    chefs: 16,
    recipes: 95,
    title: "Kolacja",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/cook_new@2x.png",
    color: kSupperColor,
  ),
  RecipeBundle(
    id: 4,
    chefs: 16,
    recipes: 95,
    title: "Przekąski",
    description: "New and tasty recipes every minute",
    imageSrc: "assets/images/cook_new@2x.png",
    color: kSnackColor,
  ),
];
