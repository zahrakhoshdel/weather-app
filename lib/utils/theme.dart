import 'package:flutter/material.dart';

abstract class Styles {
  //colors
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Color(0xff000000);

  static const Color darkThemeColor = Color(0xff302d43);
  static const Color lightThemeColor = Color(0xfffafafa); //f4f2f7

  static const Color primaryDarkColor = Color(0xff2a273a);
  static const Color primaryLightColor = Color(0xfff5f5f5); //f9f9f9  f1f2f6

  static const Color secondaryDarkColor = Color(0xff3e3b51);
  static const Color secondaryLightColor = Color(0xffefeff0);

  static const Color textLightColor = Color(0xff919196);
  static const Color textDarkColor = Color(0xffa1a0a7);

  static const Color blueColor = Color(0xff4489df);

  static const Color gradientColor1 = Color(0xff7c6ce8);
  static const Color gradientColor2 = Color(0xffb4cbff);

//////////////////////// new colors
  static const Color newBlak = Color(0xff1A1D26);
  static const Color newPurpleDark = Color(0xff806EF8);
  static const Color newBlueLight = Color(0xffAECDFF);
  static const Color newPrimaryBackgroundLight = Color(0xffe8ebec);

  static const Color grayColorLight2 = Color(0xff808080); //909095
  static const Color grayColorLight1 = Color(0xFFa8aaad); //909095
  static const Color grayColor = Color(0xff5e5e5e);
  static const Color greyColorLight = Color(0xffd7d7d7);

  //Strings
  static const TextStyle largeTextStyle = TextStyle(
    color: Styles.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
  );
  static const TextStyle largeTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
  );
  static const TextStyle largeTextStyleGRey = TextStyle(
    color: Styles.grayColor,
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
  );

  static const TextStyle defaultTextStyle = TextStyle(
    color: Styles.whiteColor,
    fontSize: 18.0,
  );
  static const TextStyle defaultTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontSize: 18.0,
  );
  static const TextStyle defaultTextStyleGRey = TextStyle(
    color: Styles.grayColor,
    fontWeight: FontWeight.normal,
    fontSize: 18.0,
  );
  static const TextStyle smallTextStyleGRey = TextStyle(
    color: Styles.grayColor,
    fontSize: 16.0,
  );
  static const TextStyle smallTextStyle = TextStyle(
    color: Styles.newPurpleDark,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle smallTextStyleWhite = TextStyle(
    color: Styles.whiteColor,
    fontSize: 16.0,
  );
  static const TextStyle smallTextStyleBlack = TextStyle(
    color: Styles.blackColor,
    fontSize: 16.0,
  );
  static const TextStyle defaultButtonTextStyle = TextStyle(
    color: Styles.whiteColor,
    fontSize: 20,
  );

  static const TextStyle kTitleStyle = TextStyle(
    color: newBlak,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle kSubTitleStyle = TextStyle(
    color: grayColorLight1,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      //* Custom Google Font
      //  fontFamily: Devfest.google_sans_family,newPurpleDark
      // primarySwatch: isDarkTheme ? Colors.blue : Colors.purple,
      //primarySwatch: const Color(0xff806EF8),
      // primaryColor: isDarkTheme ? newBlak : Colors.white,

      backgroundColor: isDarkTheme ? darkThemeColor : lightThemeColor,
      scaffoldBackgroundColor: isDarkTheme ? darkThemeColor : lightThemeColor,

      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),

      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),

      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,

      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
