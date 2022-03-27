// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';

class HomeWelcomeMessage extends StatelessWidget {
  DarkThemeProvider theme;
  HomeWelcomeMessage({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('E , d MMMM ').format(now);

    String AM = DateFormat('a').format(DateTime.now());
    //print('dat: $AM');

    return RichText(
      text: TextSpan(
        text: 'Hello! ',
        style: theme.darkTheme
            ? Styles.largeTextStyle
            : Styles.largeTextStyleBlack,
        children: <TextSpan>[
          TextSpan(
            text: '\nGood ${(AM == 'AM') ? 'Morning' : 'Evening'}',
            style: theme.darkTheme
                ? Styles.largeTextStyle.copyWith(color: Styles.textDarkColor)
                : Styles.largeTextStyle.copyWith(color: Styles.textLightColor),
          ),
          TextSpan(
            text: '\n${formattedDate}',
            style: Styles.smallTextStyleGRey
                .copyWith(color: Styles.grayColorLight2),
          ),
        ],
      ),
    );
  }
}
