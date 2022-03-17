import 'package:firebase_core/firebase_core.dart';
import 'package:fitstat_app/routes/app_routes.dart';
import 'package:fitstat_app/screens/authenticate/ForgotPasswordScreen.dart';
import 'package:fitstat_app/screens/authenticate/LoginScreen.dart';
import 'package:fitstat_app/screens/authenticate/RegistrationScreen.dart';
import 'package:fitstat_app/screens/authenticate/cubit/auth_cubit.dart';
import 'package:fitstat_app/screens/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  // await DotEnv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitstat_app',
        theme: ThemeData(
          // backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          // We apply this to our appBarTheme because most of our appBar have this style
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: Wrapper(),

        initialRoute: AppRoutes.login,
        routes: <String, WidgetBuilder>{
          AppRoutes.login: (_) => LoginScreen(),
          AppRoutes.signup: (_) => RegistrationScreeen(),
          AppRoutes.home: (_) => HomeScreen(),
          AppRoutes.forgotPassword: (_) => ForgotPasswordScreen(),
        },
      ),
    );
  }
}
