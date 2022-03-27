// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/widgets/weather_icon.dart';

class SearchLocationCard extends StatefulWidget {
  Weather weatherSearch;
  SearchLocationCard({Key? key, required this.weatherSearch}) : super(key: key);

  @override
  State<SearchLocationCard> createState() => _SearchLocationCardState();
}

class _SearchLocationCardState extends State<SearchLocationCard> {
  String WeatherIcon = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherSearch);
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
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Styles.greyColorLight,
            Styles.newBlueLight,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomWeatherIcon(img: WeatherIcon, width: 70),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.weatherSearch.cityName}',
                style: Styles.largeTextStyleBlack,
              ),
              Text(
                'Wind: ${widget.weatherSearch.windInfo.windspeed}   Humidity: ${widget.weatherSearch.mainInfo.humidity}',
                style: Styles.smallTextStyleGRey.copyWith(fontSize: 14),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '${widget.weatherSearch.mainInfo.temperature}',
              style: Styles.largeTextStyle
                  .copyWith(color: Styles.newPurpleDark, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
