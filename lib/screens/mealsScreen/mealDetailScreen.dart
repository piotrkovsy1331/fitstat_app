import 'package:flutter/material.dart';
import 'body.dart';


class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key key}) : super(key: key);
  static const routName = 'meal-detail';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        color: Colors.black,
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      
      // On Android by default its false
      centerTitle: true,
      title: Image.asset("assets/images/logo.png"),
    
    );
  }
}
