import 'package:fitstat_app/shared/custom_rect_tween.dart';
import 'package:flutter/material.dart';

//Hero widget tag used to identify 2 widgets that we want to navigate beetween wit a popup
const String _heroEditProfileInfo = 'edit-profile-page';

class editProfileInfoPage extends StatefulWidget {
  editProfileInfoPage({Key key}) : super(key: key);

  @override
  _editProfileInfoPageState createState() => _editProfileInfoPageState();
}

class _editProfileInfoPageState extends State<editProfileInfoPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    
    // return Form(
    //   key: _formKey,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       TextFormField(
    //         // The validator receives the text that the user has entered.
    //         validator: (value) {
    //           if (value == null || value.isEmpty) {
    //             return 'Please enter some text';
    //           }
    //           return null;
    //         },
    //       ),
    //       // Padding(
    //       //   padding: const EdgeInsets.symmetric(vertical: 16.0),
    //       //   // child: ElevatedButton(
    //       //   //   onPressed: () {
    //       //   //     // Validate returns true if the form is valid, or false otherwise.
    //       //   //     if (_formKey.currentState!.validate()) {
    //       //   //       // If the form is valid, display a snackbar. In the real world,
    //       //   //       // you'd often call a server or save the information in a database.
    //       //   //       ScaffoldMessenger.of(context)
    //       //   //           .showSnackBar(SnackBar(content: Text('Processing Data')));
    //       //   //     }
    //       //   //   },
    //       //   //   child: Text('Submit'),
    //       //   ),
    //       // ),
    //     ],
    //   ),
    // );
  }
}
// class editProfileInfoCard extends StatefulWidget {
//   const editProfileInfoCard({Key key}) : super(key: key);

//   @override
//   _editProfileInfoCardState createState() => _editProfileInfoCardState();
// }

// class _editProfileInfoCardState extends State<editProfileInfoCard> {
//   @override
//   String _name;
//   String _surName;
//   int _age;
//   int _weight;
//   int _height;

//   // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   // Widget _buildNameField() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(labelText: 'Imię'),
//   //     maxLength: 10,
//   //     validator: (String value) {
//   //       if (value.isNotEmpty) {
//   //         return 'Podaj imię';
//   //       }
//   //       return null;
//   //     },
//   //     onSaved: (String value) {
//   //       _name = value;
//   //     },
//   //   );
//   // }

//   // Widget _buildAgeField() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(labelText: 'Nazwisko'),
//   //     keyboardType: TextInputType.name,
//   //     validator: (String value) {
//   //       if (value == null) {
//   //         return 'Podaj nazwisko';
//   //       }
//   //       return null;
//   //     },
//   //     onSaved: (String value) {
//   //       _surName = value;
//   //     },
//   //   );
//   // }

//   // Widget _buildWeightField() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(labelText: 'Wiek'),
//   //     keyboardType: TextInputType.number,
//   //     validator: (String value) {
//   //       int age = int.tryParse(value);
//   //       if (age == null) {
//   //         return 'Podaj swój wiekwiek';
//   //       }
//   //       // else if (age <= 0 || age >= 120) {
//   //       //   return 'Podano niewłaściwy wiek';
//   //       // }
//   //       return null;
//   //     },
//   //     onSaved: (String value) {
//   //       _age = int.tryParse(value);
//   //     },
//   //   );
//   // }

//   // Widget _buildHeighttField() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(labelText: 'Waga'),
//   //     keyboardType: TextInputType.number,
//   //     validator: (String value) {
//   //       int weight = int.tryParse(value);
//   //       if (weight == null) {
//   //         return 'Podaj swoją wagę';
//   //       }
//   //       // else if (weight <= 0 || weight >= 300) {
//   //       //   return 'Podano niewłasciwą wagę ';
//   //       // }
//   //       return null;
//   //     },
//   //     onSaved: (String value) {
//   //       _weight = int.tryParse(value);
//   //     },
//   //   );
//   // }

//   // Widget _buildSurnameField() {
//   //   return TextFormField(
//   //     decoration: InputDecoration(labelText: 'Wzrost'),
//   //     keyboardType: TextInputType.number,
//   //     validator: (String value) {
//   //       int height = int.tryParse(value);
//   //       if (height == null) {
//   //         return 'Podaj swój wzrost w cm';
//   //       }
//   //       else if (height <= 0 || height >= 300) {
//   //         return 'Podano niewłaściwy wzrost';
//   //       }
//   //       return null;
//   //     },
//   //     onSaved: (String value) {
//   //       _height = int.tryParse(value);
//   //     },
//   //   );
//   // }

//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(32.0),
//         child: Hero(
//           tag: _heroEditProfileInfo,
//           createRectTween: (begin, end) {
//             return CustomRectTween(begin: begin, end: end);
//           },
//           child: Material(
//             borderRadius: BorderRadius.circular(32.0),
//             color: Color(0xFFef8354),
//             child: Form(
//               // key: _formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // _buildNameField(),
//                     // _buildSurnameField(),
//                     // _buildWeightField(),
//                     // _buildHeighttField(),
//                     // _buildAgeField(),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Imię'),
//                       maxLength: 10,
//                       validator: (String value) {
//                         if (value.isNotEmpty) {
//                           return 'Podaj imię';
//                         }
//                         return null;
//                       },
//                       onSaved: (String value) {
//                         _name = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Nazwisko'),
//                       keyboardType: TextInputType.name,
//                       validator: (String value) {
//                         if (value == null) {
//                           return 'Podaj nazwisko';
//                         }
//                         return null;
//                       },
//                       onSaved: (String value) {
//                         _surName = value;
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Wiek'),
//                       keyboardType: TextInputType.number,
//                       validator: (String value) {
//                         int age = int.tryParse(value);
//                         if (age == null) {
//                           return 'Podaj swój wiekwiek';
//                         }
//                         // else if (age <= 0 || age >= 120) {
//                         //   return 'Podano niewłaściwy wiek';
//                         // }
//                         return null;
//                       },
//                       onSaved: (String value) {
//                         _age = int.tryParse(value);
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Waga'),
//                       keyboardType: TextInputType.number,
//                       validator: (String value) {
//                         int weight = int.tryParse(value);
//                         if (weight == null) {
//                           return 'Podaj swoją wagę';
//                         }
//                         // else if (weight <= 0 || weight >= 300) {
//                         //   return 'Podano niewłasciwą wagę ';
//                         // }
//                         return null;
//                       },
//                       onSaved: (String value) {
//                         _weight = int.tryParse(value);
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Wzrost'),
//                       keyboardType: TextInputType.number,
//                       validator: (String value) {
//                         int height = int.tryParse(value);
//                         if (height == null) {
//                           return 'Podaj swój wzrost w cm';
//                         }
//                         // else if (height <= 0 || height >= 300) {
//                         //   return 'Podano niewłaściwy wzrost';
//                         // }
//                         return null;
//                       },
//                       onSaved: (String value) {
//                         _height = int.tryParse(value);
//                       },
//                     ),
//                     SizedBox(
//                       height: 100,
//                     ),
//                     RaisedButton(
//                       child: Text(
//                         'Zapisz',
//                         style: TextStyle(color: Colors.white, fontSize: 15.0),
//                       ),
//                       // onPressed: () {
//                       //   if (!_formKey.currentState.validate()) {
//                       //     return;
//                       //   }
//                       //   _formKey.currentState.save();

//                       //   print(_name);
//                       //   print(_surName);
//                       //   print(_age);
//                       //   print(_height);
//                       //   print(_weight);
//                       // },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
