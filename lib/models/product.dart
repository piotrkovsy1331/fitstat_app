import 'package:flutter/material.dart';

//klasa opisująca kazdy spozyty produkt spozywczy
class Product {
  final int mealType;
  final String foodName;
  final int calories;
  final int fat;
  final int protein;
  final int sugar;
  final String servingUnits;
  final String imageUrl;
//TODO dodać dodatkowe pola dla posiłku w których będą makro i mikroskladniki
  Product({
    @required this.mealType,
    @required this.foodName,
    @required this.calories,
    @required this.fat,
    @required this.protein,
    @required this.sugar,
    @required this.servingUnits,
    @required this.imageUrl,
  });
//
  Map<String, dynamic> toMap() {
    return {
      "mealType": mealType,
      "foodName": foodName,
      "calories": calories,
      "fat": fat,
      "protein": protein,
      "sugar": sugar,
      "servingUnits": servingUnits,
      "imageUrl": imageUrl
    };
  }
}
