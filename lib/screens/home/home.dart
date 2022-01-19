import 'package:fitstat_app/components/FitstatApp_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fitstat_app/components/my_bottom_nav_bar.dart';
import 'package:fitstat_app/screens/home/components/body.dart';
import 'package:fitstat_app/shared/size_config.dart';
import 'package:fitstat_app/services/auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: FitstatApp_AppBar(),
      body: Body(),
      // We are not able to BottomNavigationBar because the icon parameter dont except SVG
      // We also use Provied to manage the state of our Nav
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

 
}
