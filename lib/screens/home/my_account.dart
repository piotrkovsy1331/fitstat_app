import 'package:flutter/material.dart';
import 'package:fitstat_app/bloc_navigation/bloc_navigation.dart';

class MyAccount extends StatelessWidget with NavigationStates {
  const MyAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "My Account ",
        style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.w300),
      ),
    );
  }
}
