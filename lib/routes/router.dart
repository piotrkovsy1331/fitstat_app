import 'package:auto_route/auto_route.dart';
import 'package:fitstat_app/screens/home/HomeScreen.dart';
import 'package:fitstat_app/screens/profile/my_account.dart';
import 'package:fitstat_app/screens/search/searching.dart';
// CHANGES MADE HERE MUST BE FOLLOWED BY RUNNING 
//   flutter pub run build_runner build --delete-conflicting-outputs

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(path: '/', page: HomeScreen, children: [
    AutoRoute(
      path: 'mealsScreen',
      name: 'MealsScreenRouter',
      page: HomeScreen,
    ),
    AutoRoute(
      path: 'searchMealsScreen',
      name: 'SearchMealsScreenRouter',
      page: SearchingScreen,
    ),
    AutoRoute(
      path: 'mealsScreen',
      name: 'MealsScreenRouter',
      page: HomeScreen,
    ),
    AutoRoute(
      path: 'userAccountScreen',
      name: 'userAccountScreenRouter',
      page: UserAccountScreen,
    ),
  ])
])
class $AppRouter {}
