import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fitstat_app/models/product.dart';

class MealDay {
  final DateTime mealDayDate;
  final String foodName;
  final int calories;
  final List<dynamic> products = [];

  MealDay(this.mealDayDate, this.foodName, this.calories);
//Przepisanie obiektu na mapę
  Map<String, dynamic> toMap() =>
      {"mealDayDate ": DateTime.now(),
      "foodName" : this.foodName,
      "calories" : this.calories,
      "products": this.products};
}
