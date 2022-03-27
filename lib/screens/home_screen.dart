import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/forecast_screen.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_hourly.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/widgets/dafault_location_info.dart';
import 'package:weather_app/widgets/default_location_card.dart';
import 'package:weather_app/widgets/home_welcome_message.dart';
import 'package:weather_app/widgets/hourly_forecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WeatherHourly currentWeather;
  late List<Hourly> data;
  late bool status;
  late Weather locationWeather;

  final _dataService = DataService();

  Future<void> getWeather() async {
    final _currentWeather = await _dataService.getWeatherHourly(city: 'Tehran');
    final _locationWeather =
        await _dataService.getWeatherSearch(city: 'Tehran');

    try {
      setState(() {
        currentWeather = _currentWeather;
        locationWeather = _locationWeather;

        data = currentWeather.list.take(12).toList();

        status = true;
      });
    } catch (error) {
      print(error);
      return;
    }
  }

  String getTime() => DateFormat('E , d MMMM ', 'ar').format(DateTime.now());
  @override
  void initState() {
    status = false;
    getWeather();
    initializeDateFormatting('en_US');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return !status
        ? LoadingScreen()
        : Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 50),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomeWelcomeMessage(theme: themeChange),
                DefaultLocationCard(
                    smallCard: false,
                    theme: themeChange,
                    locationWeather: locationWeather),
                DafaultLocationInfo(
                    theme: themeChange, locationWeather: locationWeather),
                _titleForecast(themeChange),
                HourlyForecast(
                  theme: themeChange,
                  data: data,
                ),
              ],
            ),
          );
  }

  _titleForecast(DarkThemeProvider themeChange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Today',
            style: themeChange.darkTheme
                ? Styles.smallTextStyle.copyWith(color: Styles.textDarkColor)
                : Styles.smallTextStyle.copyWith(color: Styles.textLightColor)),
        TextButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ForecastScreen(
                    theme: themeChange, city: locationWeather.cityName);
              },
            ),
          ),
          child: const Text(
            'Next 7 days',
            style: Styles.smallTextStyle,
          ),
        ),
      ],
    );
  }
}
