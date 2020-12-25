import 'package:fitstat_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitstat_app/models/recipebundel.dart';
import 'package:fitstat_app/shared/size_config.dart';

class RecipeBundelCard extends StatelessWidget {
  final RecipeBundle recipeBundle;
  final Function press;

  const RecipeBundelCard({Key key, this.recipeBundle, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // Now we dont this Aspect ratio
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: recipeBundle.color,
          borderRadius: BorderRadius.circular(defaultSize * 1.8), //18
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultSize * 2), //20
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      recipeBundle.title,
                      style: TextStyle(
                          fontSize: defaultSize * 2.5, //22
                          color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
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
