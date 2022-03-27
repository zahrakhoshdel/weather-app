// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/utils/time.dart';
import 'package:weather_app/widgets/weather_icon.dart';

class DailyForecast extends StatelessWidget {
  DarkThemeProvider theme;
  List<Daily> dataDaily;
  DailyForecast({Key? key, required this.theme, required this.dataDaily})
      : super(key: key);

  String WeatherIcon = '';
  int condition = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(7),
          itemCount: dataDaily.length,
          itemBuilder: (context, index) {
            // WeatherIcon
            condition = dataDaily[index].id;
            WeatherIcon = DataService().getWeatherIcon(condition);
            // Day Abbreviation
            var string = '${Times(dataDaily[index].td).getWeekDay()}';
            var day = string.substring(0, 3);

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              height: 80,
              decoration: BoxDecoration(
                color: theme.darkTheme
                    ? Styles.secondaryDarkColor
                    : Styles.secondaryLightColor,
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
                  Text(day),
                  CustomWeatherIcon(img: WeatherIcon, width: 50),
                  Text('${dataDaily[index].description}'),
                  Text(
                      '${dataDaily[index].temp_day}°/${dataDaily[index].temp_night}°'),
                ],
              ),
            );
          }),
    );
  }
}
