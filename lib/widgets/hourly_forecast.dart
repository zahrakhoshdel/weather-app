// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models/weather_hourly.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/utils/time.dart';
import 'package:weather_app/widgets/weather_icon.dart';

class HourlyForecast extends StatelessWidget {
  DarkThemeProvider theme;
  List<Hourly> data;

  HourlyForecast({
    Key? key,
    required this.theme,
    required this.data,
  }) : super(key: key);

  String WeatherIcon = '';
  int condition = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context, index) {
            condition = data[index].id;
            WeatherIcon = DataService().getWeatherIcon(condition);
            return Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Styles.gradientColor1,
                    Styles.gradientColor2,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                      color: theme.darkTheme
                          ? Styles.lightThemeColor.withOpacity(0.2)
                          : Styles.darkThemeColor.withOpacity(0.2),
                      offset: const Offset(2, 2),
                      blurRadius: 3,
                      spreadRadius: 1)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${Times(data[index].td).getClock()}',
                    style: Styles.smallTextStyleWhite,
                  ),
                  CustomWeatherIcon(img: WeatherIcon, width: 50),
                  Text(
                    '${data[index].temp}°',
                    style: Styles.smallTextStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
