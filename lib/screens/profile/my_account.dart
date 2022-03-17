import 'package:fitstat_app/screens/profile/components/body.dart';

import 'package:fitstat_app/shared/constants.dart';
import 'package:fitstat_app/shared/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sex = ['kobieta', 'meszczyzna'];
  //form values
  // String _sex;
  // String _name;
  // int _weight;
  // int height;

  List<String> items = [
    "Rafał",
    "Paweł",
    "Andzelika",
    "Zofia",
    "Marika",
    "Tomasz",
    "Marcin"
  ];
  int selected_item = 0;
  Widget _buildItemPicker() {
    return CupertinoPicker(
        itemExtent: 60.0,
        onSelectedItemChanged: (index) {
          setState(() {
            selected_item = index;
            print("You Selecte: ${items[selected_item]}");
          });
        },
        backgroundColor: Colors.white,
        children: List<Widget>.generate(items.length, (index) {
          return Center(
            child: Text(
              items[index],
              style: TextStyle(fontSize: 22.0),
            ),
          );
        }));
  }

  // // funkcja do pokazania okna dialogowego
  // Future<Null> cupertinoDialogShow(BuildContext context) async {
  //   await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return MyDialogClass();
  //       });
  // }

  //  APPBAR WIDGET
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      // On Android it's false by default
      centerTitle: true,
      title: Text("Profile"),
      actions: <Widget>[
        FlatButton(
          onPressed: () async {},
          child: Text(
            "Wyloguj",
            style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.defaultSize * 1.6, //16
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
