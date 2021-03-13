import 'package:flutter/material.dart';
import 'addMeal.dart';
import 'mealListItem.dart';
import 'package:fitstat_app/shared/size_config.dart';
import 'package:fitstat_app/screens/mealsScreen/addMeal.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Śniadanie",
                style: TextStyle(
                  fontSize: defaultSize * 2.5, //22
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddMEal.routName);
              },
              child: Text("Dodoaj posiłek "),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => MealListItem(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
