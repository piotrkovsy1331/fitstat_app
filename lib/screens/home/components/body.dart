import 'package:flutter/material.dart';
import 'package:fitstat_app/models/recipebundel.dart';
import 'package:fitstat_app/shared/size_config.dart';

import 'categories.dart';
import 'recipe_bundel_card.dart';

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
                itemCount: recipeBundles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      SizeConfig.orientation == Orientation.landscape ? 1 : 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing:
                      SizeConfig.orientation == Orientation.landscape
                          ? SizeConfig.defaultSize * 2
                          : 0,
                  childAspectRatio: 4.2,
                ),
                itemBuilder: (context, index) => RecipeBundelCard(
                  recipeBundle: recipeBundles[index],
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
