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
        color: Color.fromRGBO(223, 242, 228, 100),
        shadowColor: Colors.green,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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
                        Text("kcal : 5"),
                        Text("tluszcz : 6"),
                        Text("bialko : 39"),
                        Text("cukier : 60"),
                      ],
                    ),
                    
                  ),
                ),
              ),
          ],
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
