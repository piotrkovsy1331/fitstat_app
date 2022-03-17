import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fitstat_app/screens/profile/editProfile/editPicture.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class editProfilePage extends StatefulWidget {
  static const routName = "userProfileEdit";

  @override
  _editProfilePageState createState() => _editProfilePageState();
}

class _editProfilePageState extends State<editProfilePage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  //
  String? _name;
  String? _surName;
  int? _age;
  int? _weight;
  int? _height;

  final GlobalKey<FormState> _formKeyUserPage = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Imię',
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      validator: (String? value) {
        if (value != null) {
          if (value.isEmpty || value.isEmpty) {
            return 'Podaj imię';
          }
        }

        return null;
      },
      onSaved: (String? value) {
        value != null ? _name = value : null;
      },
    );
  }

  Widget _buildSurnameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nazwisko',
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      validator: (String? value) {
        if (value != null) {
          if (value == null || value.isEmpty) {
            return 'Podaj nazwisko';
          }
        }

        return null;
      },
      onSaved: (String? value) {
        value != null ? _surName = value : null;
      },
    );
  }

  Widget _buildWeightField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Wiek',
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      keyboardType: TextInputType.number,
      // validator: (String? value) {
      //   if(value != null){
      //      int weight = int.tryParse(value);
      //   if (weight == null || weight.isNegative) {
      //     return 'Podaj swój wiek';
      //   }
      //   }
      //   int weight = int.tryParse(value);
      //   if (weight == null || weight.isNegative) {
      //     return 'Podaj swój wiek';
      //   }
      //   // else if (age <= 0 || age >= 120) {
      //   //   return 'Podano niewłaściwy wiek';
      //   // }

      //   return null;
      // },
      // onSaved: (String value) {
      //   _weight = int.tryParse(value);
      // },
    );
  }

  Widget _buildHeighttField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Waga',
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      keyboardType: TextInputType.number,
      // validator: (String value) {
      //   int height = int.tryParse(value);
      //   if (height == null || height.isNegative) {
      //     return 'Podaj swoją wagę';
      //   }
      //   // else if (weight <= 0 || weight >= 300) {
      //   //   return 'Podano niewłasciwą wagę ';
      //   // }
      //   return null;
      // },
      // onSaved: (String value) {
      //   _weight = int.tryParse(value);
      // },
    );
  }

  Widget _buildAgeField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Wzrost',
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(40.0),
          borderSide: new BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      keyboardType: TextInputType.number,
      // validator: (String value) {
      //   int age = int.tryParse(value);
      //   if (age == null || age.isNegative) {
      //     return 'Podaj swój wzrost w cm';
      //   }

      //   return null;
      // },
      // onSaved: (String value) {
      //   _age = int.tryParse(value);
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                EditPicture(
                  image: "assets/images/pic.png",
                ),
                FloatingActionButton(
                  onPressed: getImage,
                  tooltip: 'Wybierz zdjęcie ',
                  child: Icon(Icons.add_a_photo),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKeyUserPage,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildNameField(),
                          SizedBox(height: 15.0),
                          _buildSurnameField(),
                          SizedBox(height: 15.0),
                          _buildWeightField(),
                          SizedBox(height: 15.0),
                          _buildHeighttField(),
                          SizedBox(height: 15.0),
                          _buildAgeField(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(50.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (_formKeyUserPage.currentState!
                                      .validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text('Processing Data')));
                                  }
                                  _formKeyUserPage.currentState!.save();

                                  print(_name);
                                  print(_surName);
                                  print(_age);
                                  print(_weight);
                                  print(_height);
                                },
                                child: Material(
                                    color: Colors.greenAccent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 10, 30, 10),
                                      child: Text(
                                        "zapisz",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
