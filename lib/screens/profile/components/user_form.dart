import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: "John",
            decoration: InputDecoration(),
          ),
          TextFormField(
            initialValue: "John",
            decoration: InputDecoration(),
          ),
          TextFormField(
            initialValue: "John",
            decoration: InputDecoration(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState.validate()) {
                  //Proces Data
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
