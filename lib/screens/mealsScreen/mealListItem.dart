import 'package:fitstat_app/shared/constants.dart';
import 'package:flutter/material.dart';

// Widget that contains meal item in a meal on a day. When you click
// arrow down button the list of food quantities shows up
//TODO Add Deleting by swiping item fro right to left
class MealListItem extends StatefulWidget {
  @override
  _MealListItemState createState() => _MealListItemState();
}

class _MealListItemState extends State<MealListItem> {
  var _expanded = false;

  var meals = {
    'mealName': 'Kanapka',
  };

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        shadowColor: Colors.red,
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: GradientColors.mango,
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          )),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onLongPress: () {
                  print("Usunieto pozycje");
                },
                child: ListTile(
                  leading: Text(
                    "Kanapka Drwala ",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 3),
                  ),
                  trailing: Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),
              if (_expanded)
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          Text("kcal : 5",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          Text("tluszcz : 6",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          Text("bialko : 39",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          Text("cukier : 60",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ), //the widget you want the swipe to be detected on
      direction: DismissDirection.endToStart, // or whatever
      confirmDismiss: (direction) {
        if (direction == DismissDirection.endToStart) {
          // or other directions
          // Swiped up do your thing.
        }
        return Future.value(
            false); // always deny the actual dismiss, else it will expect the widget to be removed
      },
    );
  }
}
