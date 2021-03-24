import 'package:fitstat_app/models/appUser.dart';
import 'package:fitstat_app/screens/authenticate/authenticate.dart';
import 'package:fitstat_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    print(user);
    //Return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
