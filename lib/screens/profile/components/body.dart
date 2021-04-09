import 'package:fitstat_app/screens/profile/components/editProfilInfo.dart';
import 'package:fitstat_app/shared/custom_rect_tween.dart';
import 'package:flutter/material.dart';
import 'package:fitstat_app/shared/size_config.dart';

import 'info.dart';
import 'profile_menu_item.dart';
import 'package:fitstat_app/shared/hero_dialog_route.dart';

const String _heroEditProfileInfo = 'edit-profile-page';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Info(
                  image: "assets/images/pic.png",
                  name: "Rafał",
                  email: "rafal13@gmail.com",
                ),
                SizedBox(height: SizeConfig.defaultSize * 2), //20
                ProfileMenuItem(
                  iconSrc: "assets/icons/person.svg",
                  title: "Rafał Piotrkowski",
                  press: () {},
                ),
                ProfileMenuItem(
                  iconSrc: "assets/icons/weight.svg",
                  title: "86 kg",
                  press: () {},
                ),
                ProfileMenuItem(
                  iconSrc: "assets/icons/age.svg",
                  title: "24 lata",
                  press: () {},
                ),
                ProfileMenuItem(
                  iconSrc: "assets/icons/height.svg",
                  title: "182 cm",
                  press: () {},
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(HeroDialogRoute(builder: (context) {
                    return editProfileInfoCard();
                  }));
                },
                child: Hero(
                  tag: _heroEditProfileInfo,
                  createRectTween: (begin, end) {
                    return CustomRectTween(begin: begin, end: end);
                  },
                  child: Material(
                    color: Colors.redAccent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Icon(
                      Icons.edit_sharp,
                      size: 56,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
