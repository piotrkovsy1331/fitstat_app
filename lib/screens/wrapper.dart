import 'package:fitstat_app/screens/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(user);
    // //Return either home or authenticate widget
    // if (user == null) {
    //   return Authenticate();
    // } else {
    //   return HomeScreen();
    // }
    return HomeScreen();
  }
}
