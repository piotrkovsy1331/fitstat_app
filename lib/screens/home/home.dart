import 'package:fitstat_app/screens/home/my_account.dart';
import 'package:fitstat_app/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:fitstat_app/services/auth.dart';
import 'package:fitstat_app/bloc_navigation/bloc_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../sidebar/sidebar.dart';

class Home extends StatelessWidget with NavigationStates {
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        //PRzekazałem Do NAvigationBLoc jako argument stronę Home() jednak czy to jest oK
        create: (context) => NavigationBloc(MyAccount()),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}

//  backgroundColor: backgroundColor,
//       appBar: AppBar(
//         title: Text('Fitstatapp'),
//         backgroundColor: backgroundColor,
//         elevation: 0,
//         actions: <Widget>[
//           FlatButton.icon(
//             icon: Icon(Icons.person),
//             label: Text('logout'),
//             onPressed: () async {
//               await _auth.signOut();
//             },
//           )
//         ],
//       ),
//       body: Stack(
//         children: <Widget>[
//           // BurgerMenu(),
//           // Dashboard()
//           DiaryPage(),
//         ],
//       ),
