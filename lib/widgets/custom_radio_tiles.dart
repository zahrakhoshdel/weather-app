// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/setting_model.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';

class CustomRadioTiles extends StatefulWidget {
  List<SettingModel> group;
  CustomRadioTiles({Key? key, required this.group}) : super(key: key);

  @override
  State<CustomRadioTiles> createState() => _CustomRadioTilesState();
}

class _CustomRadioTilesState extends State<CustomRadioTiles> {
  Widget makeRadioTiles(DarkThemeProvider themeChange) {
    List<Widget> list = [];

    for (int i = 0; i < widget.group.length; i++) {
      list.add(Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: themeChange.darkTheme
                ? Styles.primaryDarkColor
                : Styles.primaryLightColor,
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: RadioListTile(
          value: widget.group[i].dark,
          groupValue: themeChange.darkTheme,
          //selected: widget.group[i].dark,
          selected: widget.group[i].selected,
          onChanged: (bool? val) {
            setState(() {
              for (int i = 0; i < widget.group.length; i++) {
                widget.group[i].selected = false;
              }
              widget.group[i].selected = true;
              themeChange.darkTheme = val!;
            });
          },
          activeColor: Styles.newPurpleDark,
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            ' ${widget.group[i].text}',
            style: TextStyle(
              color: themeChange.darkTheme
                  ? Styles.greyColorLight
                  : Styles.grayColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
    }

    Column column = Column(
      children: list,
    );
    return column;
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return makeRadioTiles(themeChange);
  }
}
