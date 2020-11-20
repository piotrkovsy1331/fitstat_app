import 'package:flutter/material.dart';
import 'package:fitstat_app/bloc_navigation/bloc_navigation.dart';

class DiaryPage extends StatelessWidget with NavigationStates {
  const DiaryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Mój Dziennik",
        style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.w300),
      ),
    );
  }
}
