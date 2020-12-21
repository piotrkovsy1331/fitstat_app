// import 'package:fitstat_app/models/user.dart';
// import 'package:fitstat_app/screens/wrapper.dart';
// import 'package:fitstat_app/services/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<User>.value(
//       value: AuthService().user,
//       child: MaterialApp(
//         home: Wrapper(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitstat_app/shared/constants.dart';
import 'package:fitstat_app/models/NavItem.dart';
import 'package:fitstat_app/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavItems(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        theme: ThemeData(
          // backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          // We apply this to our appBarTheme because most of our appBar have this style
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
