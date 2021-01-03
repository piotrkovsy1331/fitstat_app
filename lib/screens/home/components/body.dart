import 'package:flutter/material.dart';
import 'package:fitstat_app/models/meal.dart';
import 'package:fitstat_app/shared/size_config.dart';

import 'meals.dart';
import 'meal_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Categories(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize),
              child: GridView.builder(
                itemCount: meals.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 3.0,
                ),
                itemBuilder: (context, index) => MealCard(
                  meal: meals[index],
                  press: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
