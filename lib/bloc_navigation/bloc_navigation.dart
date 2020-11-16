import 'package:fitstat_app/screens/home/dashboard.dart';
// import 'package:flutter/material.dart';
import '../screens/home/home.dart';
import '../screens/home/last_results.dart';
import '../screens/home/my_account.dart';
// import '../screens/home/home.dart';
// import '../screens/authenticate/authenticate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationEvents {
  HomeClickedEvent,
  LastResultsClickedEvent,
  MyAccountClickedEvent,
  DashboardClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  NavigationStates get initialState => Home();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeClickedEvent:
        yield Home();
        break;
      case NavigationEvents.LastResultsClickedEvent:
        yield DiaryPage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccount();
        break;
      case NavigationEvents.DashboardClickedEvent:
        yield Dashboard();
        break;
    }
  }
}
