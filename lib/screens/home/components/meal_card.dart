import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitstat_app/models/meal.dart';
import 'package:fitstat_app/shared/size_config.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final Function press;

  const MealCard({Key key, this.meal, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: meal.gradientColors,
          ),

          borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Text(
                          meal.title,
                          style: TextStyle(
                            fontSize: defaultSize * 2.5, //22
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                        Spacer(),
                        Icon(
                          Icons.add_circle,
                          size: defaultSize * 2.8,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                          "100",
                          style: TextStyle(
                              fontSize: defaultSize * 1.5, //22
                              color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                        Spacer(),
                        Text(
                          "53,4",
                          style: TextStyle(
                              fontSize: defaultSize * 1.5, //22
                              color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                        Spacer(),
                        Text(
                          "46,13",
                          style: TextStyle(
                              fontSize: defaultSize * 1.5, //22
                              color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                        Spacer(),
                        Text(
                          "29%",
                          style: TextStyle(
                              fontSize: defaultSize * 1.5, //22
                              color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                        ),
                        Spacer(),
                        // Icon(
                        //   Icons.keyboard_arrow_down,
                        //   color: Colors.white,
                        //   size: defaultSize * 2,
                        // ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    // ExpansionTile(
                    //   title: Text("Blalbla"),
                    //   leading: Icon(Icons.local_pizza),
                    //   trailing: Icon(Icons.headset),
                    //   children: <Widget>[
                    //     Row(
                    //       children: <Widget>[
                    //         Text("Pokaz kotku co masz w środku "),
                    //         Text("Pokaz kotku co masz w środku "),
                    //         Text("Pokaz kotku co masz w środku "),
                    //       ],
                    //     ),
                    //     Text("Pokaz kotku co masz w środku "),
                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {String iconSrc, text}) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(iconSrc),
        SizedBox(width: defaultSize), // 10
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
