import 'package:fitstat_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitstat_app/bloc_navigation/bloc_navigation.dart';

class Dashboard extends StatefulWidget with NavigationStates {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  bool isColllapsed = true;
  double screenWidth;
  double screenHeight;

  final Duration duration = const Duration(milliseconds: 300);
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        elevation: 8,
        color: backgroundColor,
        child: Container(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        isColllapsed = !isColllapsed;
                        print(isColllapsed);
                      });
                    },
                  ),
                  Text(
                    'Twoje ostatnie wyniki ',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
