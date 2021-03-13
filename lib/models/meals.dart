import 'mealItem.dart';

class Meals {
  List<MealItem> _meals = [];

  List<MealItem> get meals {
    return [...meals];
  }
}

class Breakfast {
  String mealName;
  int calories;
  int fat;
  int protein;
  int sugar;
  int carbs;

  Breakfast(
      {this.mealName = "",
      this.calories = 0,
      this.fat = 0,
      this.protein = 0,
      this.carbs = 0,
      this.sugar = 0});
}

class Lunch {
  String mealName;
  int calories;
  int fat;
  int protein;
  int sugar;
  int carbs;

  Lunch(
      {this.mealName = "",
      this.calories = 0,
      this.fat = 0,
      this.protein = 0,
      this.carbs = 0,
      this.sugar = 0});
}


class Dinner {
  String mealName;
  int calories;
  int fat;
  int protein;
  int sugar;
  int carbs;

  Dinner(
      {this.mealName = "",
      this.calories = 0,
      this.fat = 0,
      this.protein = 0,
      this.carbs = 0,
      this.sugar = 0});
}


class Supper {
  String mealName;
  int calories;
  int fat;
  int protein;
  int sugar;
  int carbs;

  Supper(
      {this.mealName = "",
      this.calories = 0,
      this.fat = 0,
      this.protein = 0,
      this.carbs = 0,
      this.sugar = 0});
}

class Snack {
  String mealName;
  int calories;
  int fat;
  int protein;
  int sugar;
  int carbs;

  Snack(
      {this.mealName = "",
      this.calories = 0,
      this.fat = 0,
      this.protein = 0,
      this.carbs = 0,
      this.sugar = 0});
}

