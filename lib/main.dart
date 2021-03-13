
import 'package:fitstat_app/screens/wrapper.dart';
import 'package:fitstat_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitstat_app/models/NavItem.dart';
import 'package:fitstat_app/models/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fitstat_app/screens/mealsScreen/mealDetailScreen.dart';
import 'package:fitstat_app/screens/mealsScreen/addMeal.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavItems>(create: (context) => NavItems()),
        StreamProvider<User>.value(value: AuthService().user),
      ],
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
        home: Wrapper(),
        routes: {MealDetailScreen.routName: (context) => MealDetailScreen(),
        AddMEal.routName: (context) => AddMEal(),
        },
      ),
    );
  }
}
