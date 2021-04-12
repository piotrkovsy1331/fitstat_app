import 'package:fitstat_app/screens/profile/editProfile/editProfileInfo.dart';

import 'package:flutter/material.dart';
import 'package:fitstat_app/shared/size_config.dart';

import 'info.dart';
import 'profile_menu_item.dart';

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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(editProfilePage.routName);
                      },
                      child: Material(
                          color: Colors.greenAccent,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Text(
                                "Edytuj",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
