// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/models/weather_hourly.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/widgets/custom_back_button.dart';
import 'package:weather_app/widgets/dafault_location_info.dart';
import 'package:weather_app/widgets/daily_forecast.dart';
import 'package:weather_app/widgets/hourly_forecast.dart';
import 'package:weather_app/widgets/weather_icon.dart';

class ForecastScreen extends StatefulWidget {
  DarkThemeProvider theme;

  String city;
  ForecastScreen({
    Key? key,
    required this.theme,
    required this.city,
  }) : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  bool status = false;
  String WeatherIcon = '';

  final _dataService = DataService();

  Weather? weatherSearch;
  WeatherHourly? hourlySearched;
  WeatherDaily? dailyWeather;

  late List<Hourly> dataHourly;
  late List<Daily> dataDaily;

  Future<void> search() async {
    final _weatherSearch =
        await _dataService.getWeatherSearch(city: widget.city);

    final _hourlySearched =
        await _dataService.getWeatherHourly(city: widget.city);
    final _dailyWeather = await _dataService.getWeatherDaily(city: widget.city);
    try {
      setState(() {
        weatherSearch = _weatherSearch;
        hourlySearched = _hourlySearched;
        dailyWeather = _dailyWeather;

        dataHourly = hourlySearched!.list.take(12).toList();
        dataDaily = dailyWeather!.list.take(7).toList();

        if (weatherSearch == null) {
          WeatherIcon = 'ERROR';
          return;
        }
        var condition = weatherSearch!.weatherInfo.id;
        WeatherIcon = DataService().getWeatherIcon(condition);

        status = true;
      });
    } catch (error) {
      print(error);
      return;
    }
  }

  @override
  void initState() {
    search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('E , d MMMM ').format(now);
    return Scaffold(
      extendBodyBehindAppBar: true,
      //extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CustomBackButton(
          theme: themeChange,
          tapEvent: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: !status
            ? LoadingScreen()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: FlatButton(
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: Icon(
                    //       Icons.arrow_back_ios,
                    //       size: 50.0,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          '${weatherSearch!.cityName}, ${weatherSearch!.sysInfo.country}',
                          style: widget.theme.darkTheme
                              ? Styles.largeTextStyle
                                  .copyWith(color: Styles.textDarkColor)
                              : Styles.largeTextStyle
                                  .copyWith(color: Styles.textLightColor),
                        ),
                        Text(
                          '${weatherSearch!.mainInfo.temperature}°',
                          style: Styles.largeTextStyle
                              .copyWith(color: Styles.newPurpleDark),
                        ),
                        CustomWeatherIcon(img: WeatherIcon, width: 100),
                        Text('${weatherSearch!.weatherInfo.description}'),
                        Text('${formattedDate}'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DafaultLocationInfo(
                        theme: themeChange, locationWeather: weatherSearch!),
                    const SizedBox(
                      height: 30,
                    ),
                    HourlyForecast(
                      theme: themeChange,
                      data: dataHourly,
                      // weatherIcon: WeatherIcon,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Next 7 days',
                        style: themeChange.darkTheme
                            ? Styles.smallTextStyle
                                .copyWith(color: Styles.textDarkColor)
                            : Styles.smallTextStyle
                                .copyWith(color: Styles.textLightColor)),
                    DailyForecast(theme: themeChange, dataDaily: dataDaily),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
