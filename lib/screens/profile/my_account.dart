import 'package:fitstat_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

  // funkcja do pokazania okna dialogowego
  Future<Null> cupertinoDialogShow(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialogClass();
        });
  }

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
          onPressed: () {},
          child: Text(
            "Edit",
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

  // return Scaffold(
  //   appBar: AppBar(
  //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //     elevation: 1,
  //     leading: Icon(
  //       Icons.arrow_back,
  //       color: Colors.green,
  //     ),
  //   ),
  //   body: Container(
  //     padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
  //     child: ListView(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
  //           child: Text('Edytuj Profil',
  //               style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
  //         ),
  //         SizedBox(height: 25),
  //         Center(
  //           child: Stack(
  //             children: [
  //               Container(
  //                 padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
  //                 width: 130,
  //                 height: 130,
  //                 decoration: BoxDecoration(
  //                     border: Border.all(
  //                       width: 4,
  //                       color: Theme.of(context).scaffoldBackgroundColor,
  //                     ),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         offset: Offset.zero,
  //                         blurRadius: 10,
  //                         spreadRadius: 2,
  //                         color: Colors.black,
  //                       )
  //                     ],
  //                     shape: BoxShape.circle,
  //                     image: DecorationImage(
  //                         fit: BoxFit.cover,
  //                         image: NetworkImage(
  //                             "https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?cs=srgb&dl=pexels-jack-winbow-1559486.jpg&fm=jpg"))),
  //               ),
  //               Positioned(
  //                 bottom: 0,
  //                 right: 0,
  //                 child: Container(
  //                   height: 40,
  //                   width: 40,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     border: Border.all(
  //                       width: 4,
  //                       color: Theme.of(context).scaffoldBackgroundColor,
  //                     ),
  //                     color: Colors.green,
  //                   ),
  //                   child: Icon(
  //                     Icons.edit,
  //                     color: Theme.of(context).scaffoldBackgroundColor,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Form(
  //           key: _formKey,
  //           child: Column(
  //             children: <Widget>[
  //               SizedBox(height: 15.0),
  //               Text(
  //                 "Aktualizuj swoje dane ",
  //                 style: TextStyle(fontSize: 18.0, color: Colors.black),
  //               ),
  //               SizedBox(height: 20.0),
  //               TextFormField(
  //                 decoration: textInputDecoration,
  //                 validator: (value) => value.isEmpty ? "Podaj imie " : null,
  //                 onChanged: (value) => setState(() => _name = value),
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               DropdownButtonFormField(
  //                 value: _sex ?? 'meszczyzna',
  //                 items: sex.map((wchichSex) {
  //                   return DropdownMenuItem(
  //                     value: wchichSex,
  //                     child: Text('$wchichSex'),
  //                   );
  //                 }).toList(),
  //                 onChanged: (value) => setState(() => _sex = value),
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               CupertinoButton(
  //                   child: Text("press me "),
  //                   color: CupertinoColors.activeBlue,
  //                   onPressed: () {
  //                     cupertinoDialogShow(context);
  //                   }),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               CupertinoButton(
  //                   child: Text("wybierz swoją wage "),
  //                   color: CupertinoColors.activeBlue,
  //                   onPressed: () async {
  //                     await showModalBottomSheet<int>(
  //                         context: context,
  //                         builder: (BuildContext context) {
  //                           return _buildItemPicker();
  //                         });
  //                   }),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               RaisedButton(
  //                 onPressed: () async {
  //                   print(_name);
  //                   print(_sex);
  //                 },
  //                 color: Colors.pink[400],
  //                 child: Text(
  //                   "Zapisz",
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // );

}

class MyDialogClass extends StatefulWidget {
  MyDialogClass({Key key}) : super(key: key);

  @override
  _MyDialogClassState createState() => _MyDialogClassState();
}

class _MyDialogClassState extends State<MyDialogClass> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        "Alerting you",
        style: TextStyle(color: Colors.red),
      ),
      content: Text("Guwno dupa cycyki"),
      actions: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text(
              "Verify",
              style: TextStyle(color: Colors.blue),
            )),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
