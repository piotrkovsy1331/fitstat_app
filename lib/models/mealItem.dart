import 'package:flutter/material.dart';
import 'package:fitstat_app/shared/constants.dart';
import 'product.dart';

//Model for MealItem that consists from model_items
class MealItem {
  final String id;
  final int mealtype;
  final int amount;
  final List<Product> meals;
  final DateTime date;

  MealItem({
    this.id,
    this.mealtype,
    this.amount,
    this.meals,
    this.date,
  });
}
