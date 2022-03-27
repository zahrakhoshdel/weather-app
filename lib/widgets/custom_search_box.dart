// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';

class CustomSearchBox extends StatelessWidget {
  TextEditingController? controller;
  DarkThemeProvider theme;

  CustomSearchBox({
    Key? key,
    this.controller,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        color: theme.darkTheme
            ? Styles.primaryDarkColor
            : Styles.primaryLightColor,
      ),
      child: TextFormField(
        style: theme.darkTheme
            ? Styles.defaultTextStyleGRey.copyWith(color: Styles.greyColorLight)
            : Styles.defaultTextStyleGRey,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.search_outlined,
              size: 28.0,
              color: theme.darkTheme
                  ? Styles.grayColorLight1
                  : Styles.grayColorLight2,
            ),
          ),
          hintText: 'Search',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.all(10.0),
          hintStyle: TextStyle(
            color: theme.darkTheme
                ? Styles.grayColorLight1
                : Styles.grayColorLight2,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        cursorColor: Colors.white,
        controller: controller,
      ),
    );
  }
}
