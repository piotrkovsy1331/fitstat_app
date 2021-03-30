import 'package:fitstat_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitstat_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:fitstat_app/models/appUser.dart';

import 'package:fitstat_app/components/my_bottom_nav_bar.dart';
import 'package:fitstat_app/shared/constants.dart';
import 'package:fitstat_app/screens/profile/components/body.dart';
import 'package:fitstat_app/shared/size_config.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final AuthService auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final List<String> sex = ['kobieta', 'meszczyzna'];
  //form values
  String _sex;
  String _name;
  int _weight;
  int height;

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
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
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
          onPressed: () async {
            await auth.signOut();
          },
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

// class MyDialogClass extends StatefulWidget {
//   MyDialogClass({Key key}) : super(key: key);

//   @override
//   _MyDialogClassState createState() => _MyDialogClassState();
// }

// class _MyDialogClassState extends State<MyDialogClass> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoAlertDialog(
//       title: Text(
//         "Alerting you",
//         style: TextStyle(color: Colors.red),
//       ),
//       content: Text("Guwno dupa cycyki"),
//       actions: <Widget>[
//         FlatButton(
//             onPressed: () {},
//             child: Text(
//               "Verify",
//               style: TextStyle(color: Colors.blue),
//             )),
//         FlatButton(
//             onPressed: () {
//               Navigator.of(context).pop(context);
//             },
//             child: Text(
//               "Cancel",
//               style: TextStyle(color: Colors.blue),
//             ))
//       ],
//     );
//   }
// }
