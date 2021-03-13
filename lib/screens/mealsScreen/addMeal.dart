import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fitstat_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:fitstat_app/models/user.dart';

class AddMEal extends StatefulWidget {
  static const routName = 'add';

  @override
  _AddMEalState createState() => _AddMEalState();
}

class _AddMEalState extends State<AddMEal> {
  final _formKey = GlobalKey<FormBuilderState>();
  final DatabaseService _databaseService = DatabaseService();
  String _foodName;
  String _calories;
  String _protein;
  String _fat;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Container(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      FormBuilderFilterChip(
                        name: 'filter_chip',
                        decoration: InputDecoration(
                          labelText: 'Select many options',
                        ),
                        options: [
                          FormBuilderFieldOption(
                              value: 'Test', child: Text('Test')),
                          FormBuilderFieldOption(
                              value: 'Test 1', child: Text('Test 1')),
                          FormBuilderFieldOption(
                              value: 'Test 2', child: Text('Test 2')),
                          FormBuilderFieldOption(
                              value: 'Test 3', child: Text('Test 3')),
                          FormBuilderFieldOption(
                              value: 'Test 4', child: Text('Test 4')),
                        ],
                      ),
                      FormBuilderChoiceChip(
                        name: 'choice_chip',
                        decoration: InputDecoration(
                          labelText: 'Select an option',
                        ),
                        options: [
                          FormBuilderFieldOption(
                              value: 'Test', child: Text('Test')),
                          FormBuilderFieldOption(
                              value: 'Test 1', child: Text('Test 1')),
                          FormBuilderFieldOption(
                              value: 'Test 2', child: Text('Test 2')),
                          FormBuilderFieldOption(
                              value: 'Test 3', child: Text('Test 3')),
                          FormBuilderFieldOption(
                              value: 'Test 4', child: Text('Test 4')),
                        ],
                      ),
                      FormBuilderColorPickerField(
                        name: 'color_picker',
                        // initialValue: Colors.yellow,
                        colorPickerType: ColorPickerType.MaterialPicker,
                        decoration: InputDecoration(labelText: 'Pick Color'),
                      ),
                    ],
                  ),
                ),
                OutlineButton(
                  onPressed: () async {
                    await _databaseService.addMealDay(
                        '156', DateTime.now(), 53, 69, 70, user.uid);
                  },
                  child: Text("Add Meal day Document to user doc "),
                ),
                OutlineButton(
                  onPressed: () async {
                    await _databaseService.addDayMeal();
                    await _databaseService.updateProductInMealDay();
                  },
                  child: Text("Dodaj produkt "),
                ),
              ],
            ),
          ),
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
