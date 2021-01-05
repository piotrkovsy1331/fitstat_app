import 'package:flutter/material.dart';
import 'package:fitstat_app/components/my_bottom_nav_bar.dart';
import 'package:dio/dio.dart';

class Searching extends StatefulWidget {
  Searching({Key key}) : super(key: key);
  final dio = Dio(BaseOptions(
    baseUrl: 'https://trackapi.nutritionix.com/V2/search/instant',
    //TODO Dodany klucz od api na sztywno a powiniem być zaciągnięty z .env
    headers: {
      'x-app-id': '460fc3b4',
      "x-app-key": 'e27ccc02c41d94a0769a07f753c56442'
    },
  ));
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  List _foodList;

  void searchFood(String query) async {
    bool branded = true;
    final response = await widget.dio.get(
      '',
      queryParameters: {
        'query': query,
        // 'branded': branded,
      },
    );
    print(response);
    setState(() {
      _foodList = response.data['branded'];
    });
    _foodList.map((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('fitstat_app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchForm(
              onSearch: searchFood,
            ),
            _foodList == null
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black12,
                          size: 110,
                        ),
                        Text(
                          'Brak wyników do wyświetlenia,',
                          style: TextStyle(
                            color: Colors.black12,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView(
                      children: _foodList.map((food) {
                        return ListTile(
                          title: Text(
                            food['food_name'],
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            food['nf_calories'].toString(),
                            maxLines: 1,
                          ),
                          trailing: Text(
                            food['brand_name_item_name'],
                            maxLines: 1,
                          ),
                          hoverColor: Colors.yellow ,
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

//                                                                            WIGDET WYSZUKIWARKI

class SearchForm extends StatefulWidget {
  SearchForm({this.onSearch});

  final void Function(String search) onSearch;

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  var _searchedItem;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Wyszukaj produkty',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: false,
                  errorStyle: TextStyle(fontSize: 15)),
              onChanged: (value) {
                _searchedItem = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return ' Wpisz nazwe ';
                }
                return null;
              },
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  final isValid = _formKey.currentState.validate();
                  if (isValid) {
                    //TODO Perform search
                    widget.onSearch(_searchedItem);
                  } else {
                    //TODO Set autovalidate to true
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: Text(
                    'Szukaj',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
