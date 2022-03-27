import 'package:flutter/material.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/widgets/BottomNavigation/bottom_bar_controller.dart';

class BottomBarWidget extends StatelessWidget {
  final BottomBarController bottomController;

  const BottomBarWidget({Key? key, required this.bottomController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bottomController,
        builder: (context, child) {
          return BottomNavigationBar(
              selectedItemColor: Styles.newPurpleDark,
              backgroundColor: Colors.transparent,
              onTap: (index) {
                bottomController.changeTab(index);
              },
              currentIndex: bottomController.currentTab,
              items: bottomController.navPages
                  .map((page) => BottomNavigationBarItem(
                        icon: Icon(page.navIcon),
                        label: page.navLabel,
                      ))
                  .toList());
        });
  }
}
