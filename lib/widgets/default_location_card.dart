// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/widgets/weather_icon.dart';

class DefaultLocationCard extends StatefulWidget {
  bool smallCard;
  DarkThemeProvider theme;
  Weather locationWeather;

  DefaultLocationCard({
    Key? key,
    required this.smallCard,
    required this.theme,
    required this.locationWeather,
  }) : super(key: key);

  @override
  State<DefaultLocationCard> createState() => _DefaultLocationCardState();
}

class _DefaultLocationCardState extends State<DefaultLocationCard> {
  String WeatherIcon = '';
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(Weather weatherData) {
    if (weatherData == null) {
      WeatherIcon = 'ERROR';
      return;
    }
    var condition = weatherData.weatherInfo.id;

    WeatherIcon = DataService().getWeatherIcon(condition);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.smallCard ? 10 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Styles.gradientColor1,
            Styles.gradientColor2,
            // Styles.newBlueDark,
            // Styles.newBlueLight,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: widget.theme.darkTheme
                ? Styles.lightThemeColor.withOpacity(0.2)
                : Styles.darkThemeColor.withOpacity(0.2),
            offset: const Offset(3, 3),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.place),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.locationWeather.cityName,
                style: Styles.defaultTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '${widget.locationWeather.mainInfo.temperature}°',
                    style: widget.smallCard
                        ? Styles.largeTextStyleBlack.copyWith(fontSize: 20)
                        : Styles.largeTextStyleBlack,
                  ),
                  SizedBox(
                    child: Text(
                      widget.locationWeather.weatherInfo.description,
                      style: widget.smallCard
                          ? Styles.defaultTextStyleBlack
                          : Styles.defaultTextStyleBlack,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              CustomWeatherIcon(
                  img: WeatherIcon, width: widget.smallCard ? 100 : 150.0),
            ],
          ),
        ],
      ),
    );
  }
}
