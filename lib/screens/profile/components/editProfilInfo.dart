import 'package:fitstat_app/shared/custom_rect_tween.dart';
import 'package:flutter/material.dart';

//Hero widget tag used to identify 2 widgets that we want to navigate beetween wit a popup
const String _heroEditProfileInfo = 'edit-profile-page';

class editProfileInfoCard extends StatefulWidget {
  const editProfileInfoCard({Key key}) : super(key: key);

  @override
  _editProfileInfoCardState createState() => _editProfileInfoCardState();
}

class _editProfileInfoCardState extends State<editProfileInfoCard> {
  String _name;
  String _surName;
  int _age;
  int _weight;
  int _height;

  final GlobalKey<FormState> _formKeyUserPage = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Imię'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty || value.isEmpty) {
          return 'Podaj imię';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildSurnameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nazwisko'),
      maxLength: 20,
      validator: (String value) {
        if (value == null || value.isEmpty) {
          return 'Podaj nazwisko';
        }
        return null;
      },
      onSaved: (String value) {
        _surName = value;
      },
    );
  }

  Widget _buildWeightField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Wiek'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int weight = int.tryParse(value);
        if (weight == null || weight.isNegative) {
          return 'Podaj swój wiek';
        }
        // else if (age <= 0 || age >= 120) {
        //   return 'Podano niewłaściwy wiek';
        // }

        return null;
      },
      onSaved: (String value) {
        _weight = int.tryParse(value);
      },
    );
  }

  Widget _buildHeighttField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Waga'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int height = int.tryParse(value);
        if (height == null || height.isNegative) {
          return 'Podaj swoją wagę';
        }
        // else if (weight <= 0 || weight >= 300) {
        //   return 'Podano niewłasciwą wagę ';
        // }
        return null;
      },
      onSaved: (String value) {
        _weight = int.tryParse(value);
      },
    );
  }

  Widget _buildAgeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Wzrost'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int age = int.tryParse(value);
        if (age == null || age.isNegative) {
          return 'Podaj swój wzrost w cm';
        }

        return null;
      },
      onSaved: (String value) {
        _age = int.tryParse(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroEditProfileInfo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white70,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKeyUserPage,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildNameField(),
                        _buildSurnameField(),
                        _buildWeightField(),
                        _buildHeighttField(),
                        _buildAgeField(),
                        SizedBox(
                          height: 100,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          child: Text(
                            'Zapisz',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                          onPressed: () {
                            if (_formKeyUserPage.currentState.validate()) {
                              return;
                            }
                            _formKeyUserPage.currentState.save();

                            print(_name);
                            print(_surName);
                            print(_age);
                            print(_height);
                            print(_weight);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
