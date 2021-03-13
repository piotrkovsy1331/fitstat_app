import 'package:flutter/material.dart';
import 'package:fitstat_app/shared/size_config.dart';
import 'user_form.dart';
import 'info.dart';
import 'profile_menu_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/pic.png",
            name: "John",
            email: "Jhondoe01@gmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), //20
          // ProfileMenuItem(
          //   iconSrc: "assets/icons/bookmark_fill.svg",
          //   title: "Saved Recipes",
          //   press: () {},
          // ),
          // ProfileMenuItem(
          //   iconSrc: "assets/icons/chef_color.svg",
          //   title: "Super Plan",
          //   press: () {},
          // ),
          // ProfileMenuItem(
          //   iconSrc: "assets/icons/language.svg",
          //   title: "Change Language",
          //   press: () {},
          // ),
          // ProfileMenuItem(
          //   iconSrc: "assets/icons/info.svg",
          //   title: "Help",
          //   press: () {},
          // ),
          UserForm(),
        ],
      ),
    );
  }
}
