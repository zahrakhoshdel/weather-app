import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/widgets/BottomNavigation/bottom_bar_controller.dart';
import 'package:weather_app/widgets/BottomNavigation/bottom_bar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomController = BottomBarController()..init();
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        NavigatorState? currentNavState =
            bottomController.currentNavigatorPage.navKey.currentState;
        if (currentNavState?.canPop() ?? true) {
          currentNavState?.pop();
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: AnimatedBuilder(
              animation: bottomController,
              builder: (context, child) {
                return IndexedStack(
                  index: bottomController.currentTab,
                  children: bottomController.navPages
                      .map((page) => Navigator(
                            key: page.navKey,
                            onGenerateRoute: page.routes.getRoute,
                          ))
                      .toList(),
                );
              }),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: themeChange.darkTheme
                  ? Styles.primaryDarkColor
                  : Styles.primaryLightColor,
              boxShadow: [
                BoxShadow(
                  color: themeChange.darkTheme
                      ? Styles.blackColor
                      : Styles.whiteColor,
                  blurRadius: 1,
                  spreadRadius: 2,
                )
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: BottomBarWidget(
              bottomController: bottomController,
            ),
          ),
        ),
      ),
    );
  }
}
