import 'package:fitstat_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitstat_app/bloc_navigation/bloc_navigation.dart';

class MyAccount extends StatefulWidget with NavigationStates {
  const MyAccount({Key key}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final List<String> sex = ['kobieta', 'męszczyzna'];
  //form values
  String _sex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.green,
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
              child: Text('Edytuj Profil',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 25),
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset.zero,
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: Colors.black,
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?cs=srgb&dl=pexels-jack-winbow-1559486.jpg&fm=jpg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.green,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Pseudonim ",
                  hintText: "Rafał",
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(labelText: " ", hintText: ""),
            ),
            SizedBox(height: 10.0),
            DropdownButtonFormField(
              value: _sex,
              items: sex.map((sex) {
                return DropdownMenuItem(value: sex, child: Text("$sex"));
              }),
              decoration: textInputDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
