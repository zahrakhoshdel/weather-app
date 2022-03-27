import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/setting_screen.dart';

class BottomBarController extends ChangeNotifier {
  late final List<NavigatorPage> _navPages;
  List<NavigatorPage> get navPages => _navPages;

  int _currentTab = 0;
  int get currentTab => _currentTab;

  NavigatorPage get currentNavigatorPage => navPages[_currentTab];

  void init() {
    _navPages = [
      NavigatorPage(
        routes: HomeRoute(),
        navLabel: 'Home',
        navIcon: Icons.home_rounded,
      ),
      NavigatorPage(
        routes: ExploreRoute(),
        navLabel: 'Search',
        navIcon: Icons.search_rounded,
      ),
      NavigatorPage(
        routes: SettingRoute(),
        navLabel: 'Setting',
        navIcon: Icons.settings,
      ),
    ];
  }

  void changeTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}

class NavigatorPage {
  final Routes routes;
  final IconData navIcon;
  final String navLabel;
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  NavigatorPage(
      {required this.routes, required this.navIcon, required this.navLabel});
}

abstract class Routes {
  Route<dynamic> getRoute(RouteSettings settings);
}

class HomeRoute implements Routes {
  @override
  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const HomeScreen());
      default:
        return CupertinoPageRoute(
            builder: (_) => Center(
                  child: Text('${settings.name} does not exist'),
                ));
    }
  }
}

class ExploreRoute implements Routes {
  @override
  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const SearchScreen());
      // case 'search2':
      //   return CupertinoPageRoute(builder: (_) => DetailPage(city: ''));
      default:
        return CupertinoPageRoute(
            builder: (_) => Center(
                  child: Text('${settings.name} does not exist'),
                ));
    }
  }
}

class SettingRoute implements Routes {
  @override
  Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => SettingScreen());

      default:
        return CupertinoPageRoute(
            builder: (_) => Center(
                  child: Text('${settings.name} does not exist'),
                ));
    }
  }
}
