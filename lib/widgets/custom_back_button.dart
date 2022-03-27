// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';

class CustomBackButton extends StatelessWidget {
  DarkThemeProvider theme;

  CustomBackButton({Key? key, required this.theme, required this.tapEvent})
      : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: tapEvent,
        icon: Icon(
          Icons.arrow_back_ios,
          color: theme.darkTheme ? Styles.textDarkColor : Styles.textLightColor,
        ));
  }
}
