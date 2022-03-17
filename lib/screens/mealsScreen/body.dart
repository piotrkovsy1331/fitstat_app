import 'package:flutter/material.dart';
import 'addMeal.dart';
import 'mealListItem.dart';
import 'package:fitstat_app/shared/size_config.dart';
import 'package:fitstat_app/screens/mealsScreen/addMeal.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SafeArea(
      child: Stack(children: [
        Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Śniadanie",
                          style: TextStyle(
                            fontSize: defaultSize * 2.8, //22
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => MealListItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(50.0),
            child: GestureDetector(
              onTap: () {
              },
              child: Material(
                color: Colors.greenAccent,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                child: Icon(
                  Icons.add_rounded,
                  size: 70,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
