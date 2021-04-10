import 'package:fitstat_app/models/product.dart';
import 'package:fitstat_app/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fitstat_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:fitstat_app/models/appUser.dart';

class AddMEal extends StatefulWidget {
  static const routName = 'add';

  @override
  _AddMEalState createState() => _AddMEalState();
}

class _AddMEalState extends State<AddMEal> {
  final GlobalKey<FormState> _addMealFormKey = GlobalKey<FormState>();
  final DatabaseService _databaseService = DatabaseService();
  String _foodName = "Jablko";
  int _weight;
  int _calories;
  int _protein;
  int _fat;
  int _sugar;
  int _carbs;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    final _product = Product();
    double defaultSize = SizeConfig.defaultSize;

    Widget _buildFoodNameField() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Nazwa Produktu',
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(40.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(40.0),
              borderSide: BorderSide(color: Colors.green, width: 2.0)),
          fillColor: Colors.green,
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return " Podaj nazwę produktu";
          }
          return null;
        },
        onSaved: (String value) {
          _foodName = value;
        },
      );
    }

    Widget _buildFoodWeight() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Waga produktu w gramach',
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(40.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(40.0),
              borderSide: BorderSide(color: Colors.green, width: 2.0)),
        ),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int weight = int.tryParse(value);
          if (weight == null || weight.isNegative) {
            return 'Podaj wagę produktu';
          }
        },
        onSaved: (String value) {
          _weight = int.tryParse(value);
        },
      );
    }

    Widget _buildFoodProtein() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Ilość białka na 100 g produktu',
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(40.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(40.0),
              borderSide: BorderSide(color: Colors.green, width: 2.0)),
        ),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int protein = int.tryParse(value);
          if (protein == null || protein.isNegative) {
            return 'Podaj ilość białka ';
          }
        },
        onSaved: (String value) {
          _protein = int.tryParse(value);
        },
      );
    }

    Widget _buildFoodFat() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Ilość tłuszczy na 100 g produktu',
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(40.0),
            borderSide: new BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(40.0),
              borderSide: BorderSide(color: Colors.green, width: 2.0)),
        ),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int fat = int.tryParse(value);
          if (fat == null || fat.isNegative) {
            return 'Podaj ilość tłuszczy ';
          }
        },
        onSaved: (String value) {
          _fat = int.tryParse(value);
        },
      );
    }

    Widget _buildFoodSugar() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Ilość cukru na 100 g produktu',
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(40.0),
            borderSide: new BorderSide(color: Colors.green, width: 3.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(40.0),
              borderSide: BorderSide(color: Colors.green, width: 2.0)),
        ),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int sugar = int.tryParse(value);
          if (sugar == null || sugar.isNegative) {
            return 'Podaj cukrów tłuszczy ';
          }
        },
        onSaved: (String value) {
          _sugar = int.tryParse(value);
        },
      );
    }

    Widget _buildFoodCarbs() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Ilość węglowodanów na 100 g produktu',
          border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(40.0),
              borderSide: new BorderSide()),
          enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(40.0),
              borderSide: BorderSide(color: Colors.green, width: 2.0)),
        ),
        keyboardType: TextInputType.number,
        validator: (String value) {
          int carbs = int.tryParse(value);
          if (carbs == null || carbs.isNegative) {
            return 'Podaj węglowodanów tłuszczy ';
          }
        },
        onSaved: (String value) {
          _carbs = int.tryParse(value);
        },
      );
    }

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Dodaj Posiłek ",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: defaultSize * 2.8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Builder(
                          builder: (context) => Form(
                            key: _addMealFormKey,
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
                              child: Column(
                                children: [
                                  _buildFoodNameField(),
                                  SizedBox(height: 10),
                                  _buildFoodWeight(),
                                  SizedBox(height: 10),
                                  _buildFoodProtein(),
                                  SizedBox(height: 10),
                                  _buildFoodFat(),
                                  SizedBox(height: 10),
                                  _buildFoodSugar(),
                                  SizedBox(height: 10),
                                  _buildFoodCarbs(),

                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.all(50.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (_addMealFormKey.currentState
                                              .validate()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'Processing Data')));
                                          }
                                          _addMealFormKey.currentState.save();

                                          print(_foodName);
                                          print(_weight);
                                          print(_protein);
                                          print(_fat);
                                          print(_sugar);
                                          print(_carbs);
                                        },
                                        child: Material(
                                            color: Colors.greenAccent,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "zapisz",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  // ElevatedButton(
                                  //   style: ElevatedButton.styleFrom(
                                  //       primary: Colors.blueAccent,
                                  //       padding: EdgeInsets.symmetric(
                                  //           horizontal: 15, vertical: 8),
                                  //       textStyle: TextStyle(
                                  //           fontSize: 30,
                                  //           fontWeight: FontWeight.bold)),
                                  //   onPressed: () {
                                  //     if (_addMealFormKey.currentState
                                  //         .validate()) {
                                  //       return;
                                  //     }
                                  //     _addMealFormKey.currentState.save();

                                  //     print(_foodName);
                                  //     print(_weight);
                                  //     print(_protein);
                                  //     print(_fat);
                                  //     print(_sugar);
                                  //     print(_carbs);
                                  //   },
                                  //   child: Text('zapisz'),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        color: Colors.black,
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      // On Android by default its false
      centerTitle: true,
      title: Image.asset("assets/images/logo.png"),
    );
  }
}
