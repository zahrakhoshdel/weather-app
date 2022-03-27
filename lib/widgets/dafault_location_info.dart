// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/utils/time.dart';

class DafaultLocationInfo extends StatelessWidget {
  DarkThemeProvider theme;
  Weather locationWeather;
  DafaultLocationInfo(
      {Key? key, required this.theme, required this.locationWeather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Styles.newPrimaryBackgroundLight,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: theme.darkTheme
                ? Styles.lightThemeColor.withOpacity(0.2)
                : Styles.darkThemeColor.withOpacity(0.2),
            offset: const Offset(3, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _weatherInfo('${locationWeather.windInfo.windspeed}km/h', 'Wind'),
          _weatherInfo('${locationWeather.mainInfo.humidity}%', 'Humility'),
          _weatherInfo('${Times(locationWeather.sysInfo.sunrise).getClock()}AM',
              'Sunrise'),
        ],
      ),
    );
  }

  Column _weatherInfo(String info, String lableInfo) {
    return Column(
      children: [
        Text(info, style: Styles.kTitleStyle),
        Text(lableInfo, style: Styles.kSubTitleStyle),
      ],
    );
  }
}
