// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/setting_model.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/widgets/custom_radio_tiles.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _value2 = 0;

  final List<SettingModel> _groupTheme = [
    SettingModel(text: "Dark", dark: true, selected: true),
    SettingModel(text: "Light", dark: false, selected: false),
  ];
  // ignore: todo
  //TODO: unit item select
  // List<SettingModel> _groupUnit = [
  //   SettingModel(text: "Dark", index: 1, selected: true),
  //   SettingModel(text: "Light", index: 2, selected: false),
  // ];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _titleScreen(themeChange),
              _textLable(theme: themeChange, text: 'Theme'),
              CustomRadioTiles(group: _groupTheme),
              const SizedBox(
                height: 10,
              ),
              // _textLable(theme: themeChange, text: 'Unit'),
              // CustomRadioTiles(group: _groupTheme),
            ],
          ),
        ),
      ),
    );
  }

  _titleScreen(DarkThemeProvider theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
          child: Text(
        'Settings',
        style: theme.darkTheme
            ? Styles.defaultTextStyle.copyWith(fontSize: 25)
            : Styles.largeTextStyleBlack,
      )),
    );
  }

  _textLable({required DarkThemeProvider theme, required String text}) {
    return Text(text,
        style: theme.darkTheme
            ? Styles.largeTextStyleGRey.copyWith(color: Styles.greyColorLight)
            : Styles.largeTextStyleGRey);
  }
}
