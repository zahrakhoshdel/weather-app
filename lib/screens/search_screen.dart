import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/forecast_screen.dart';
import 'package:weather_app/data_service.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_hourly.dart';
import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/utils/dark_theme_provider.dart';
import 'package:weather_app/utils/theme.dart';
import 'package:weather_app/widgets/custom_search_box.dart';
import 'package:weather_app/widgets/custom_search_button.dart';
import 'package:weather_app/widgets/default_location_card.dart';
import 'package:weather_app/widgets/search_location_card.dart';

class SearchScreen extends StatefulWidget {
  final ValueChanged<int>? onPush;

  const SearchScreen({Key? key, this.onPush}) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _cityController = TextEditingController();
  late bool status;
  late bool statusSearch;
  late bool isLoading;

  final _dataService = DataService();

  Weather? weatherSearch;
  late Weather defaultSearch;
  WeatherHourly? hourlySearched;
  late List<Hourly> data;

  String cityName = '';

  @override
  void initState() {
    status = false;
    statusSearch = false;
    isLoading = false;
    getDefaultSearch();
    super.initState();
  }

  Future<void> getDefaultSearch() async {
    final _defaultSearch = await _dataService.getWeatherSearch(city: 'Tehran');
    try {
      setState(() {
        defaultSearch = _defaultSearch;
        cityName = defaultSearch.cityName;

        status = true;
      });
    } catch (error) {
      print(error);
      return;
    }
  }

  Future<void> search() async {
    final _weatherSearch =
        await _dataService.getWeatherSearch(city: _cityController.text);

    final _hourlySearched =
        await _dataService.getWeatherHourly(city: _cityController.text);
    try {
      setState(() {
        weatherSearch = _weatherSearch;
        hourlySearched = _hourlySearched;

        data = hourlySearched!.list.take(5).toList();

        //isLoading = false;
        statusSearch = true;
      });
    } catch (error) {
      print(error);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _titleScreen(themeChange),
            !status
                ? LoadingScreen()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: CustomSearchBox(
                            theme: themeChange,
                            controller: _cityController,
                          )),
                          customSearchButton(onPress: () {
                            setState(() {
                              isLoading = true;
                              statusSearch = false;
                            });
                            return search();
                          }),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _textLable(theme: themeChange, text: 'default place'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return ForecastScreen(
                                    theme: themeChange, city: cityName);
                              },
                            ),
                          ),
                          child: DefaultLocationCard(
                            smallCard: true,
                            theme: themeChange,
                            locationWeather: defaultSearch,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _textLable(theme: themeChange, text: 'Searched location'),
                      const SizedBox(
                        height: 10,
                      ),
                      !isLoading
                          ? Container()
                          : !statusSearch
                              ? LoadingScreen()
                              : Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () => Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return ForecastScreen(
                                                    theme: themeChange,
                                                    city: weatherSearch!
                                                        .cityName);
                                              },
                                            ),
                                          ),
                                      child: SearchLocationCard(
                                        weatherSearch: weatherSearch!,
                                      )),
                                )
                    ],
                  )
          ],
        ),
      ),
    );
  }

  _titleScreen(DarkThemeProvider theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
          child: Text(
        'Search For City',
        style: theme.darkTheme
            ? Styles.defaultTextStyle.copyWith(fontSize: 25)
            : Styles.largeTextStyleBlack,
      )),
    );
  }

  _textLable({required DarkThemeProvider theme, required String text}) {
    return Text(text,
        style: theme.darkTheme
            ? Styles.defaultTextStyleGRey.copyWith(color: Styles.greyColorLight)
            : Styles.defaultTextStyleGRey);
  }
}
