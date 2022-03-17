import 'package:fitstat_app/components/FitstatApp_AppBar.dart';
import 'package:fitstat_app/screens/home/components/body.dart';
import 'package:fitstat_app/shared/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: FitstatApp_AppBar(),
      body: Body(),
      // We are not able to BottomNavigationBar because the icon parameter dont except SVG
      // We also use Provied to manage the state of our Nav
    );
  }
}
