// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/models/weather_hourly.dart';

class DataService {
  final String host = "api.openweathermap.org";
  static const String API_KEY = 'Enter Your API key';
  final Map<String, String> location = {
    'longitude': '36.287025',
    'latitude': '59.604193',
  };

  Uri search({String search = 'Tehran'}) => Uri(
        scheme: "https",
        host: host,
        pathSegments: {"data", "2.5", "weather"},
        queryParameters: {
          "q": search,
          "units": "metric",
          "appid": API_KEY,
          "lang": "en"
        },
      );
  Uri weatherHourly({required String lat, required String lon}) => Uri(
        scheme: "https",
        host: host,
        pathSegments: {"data", "2.5", "onecall"},
        queryParameters: {
          "lat": lat,
          "lon": lon,
          "units": "metric",
          "appid": API_KEY,
          "lang": "en"
        },
      );

  // Future<WeatherHourly> getCurrentWeather() async {
  //   try {
  //     // Position position = await Geolocator.getCurrentPosition(
  //     //     desiredAccuracy: LocationAccuracy.low);

  //     final Uri requestUri = weatherHourly(
  //       lon: location['longitude'].toString(),
  //       lat: location['latitude'].toString(),
  //     );

  //     final http.Response response = await http.get(requestUri);
  //     if (response.statusCode == 200) {
  //     } else {
  //       throw Exception('Failed to load data weather');
  //     }

  //     final Map<String, dynamic> decodedJson = json.decode(response.body);

  //     return WeatherHourly.fromMap(decodedJson);
  //   } on SocketException catch (e) {
  //     print(e);
  //     throw "You don't have connection, try again later.";
  //   } on PlatformException catch (e) {
  //     throw "${e.message}, please allow the app to access your current location from the settings.";
  //   } catch (e) {
  //     print(e);
  //     throw "Unknown error, try again.";
  //   }
  // }

  Future<Weather> getWeatherSearch({required String city}) async {
    try {
      final http.Response response = await http.get(search(
        search: city,
      ));
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        return Weather.fromJson(decodedJson);
      } else {
        return throw Exception('Failed to load data weather');
      }
    } on SocketException catch (e) {
      print(e);
      throw "You don't have connection, try again later.";
    } catch (e) {
      print(e);
      throw "Unknown error, try again.";
    }
  }

  Future<WeatherHourly> getWeatherHourly({required String city}) async {
    try {
      final http.Response response = await http.get(search(
        search: city,
      ));
      //print(response.body);
      final json = jsonDecode(response.body);

      final Uri requestUri = weatherHourly(
        lat: json['coord']['lat'].toString(),
        lon: json['coord']['lon'].toString(),
      );

      final http.Response responseH = await http.get(requestUri);
      if (responseH.statusCode == 200) {
        final Map<String, dynamic> jsonString = jsonDecode(responseH.body);
        return WeatherHourly.fromMap(jsonString);
      } else {
        return throw Exception('Failed to load data weather');
      }
    } on SocketException catch (e) {
      print(e);
      throw "You don't have connection, try again later.";
    } catch (e) {
      print(e);
      throw "Unknown error, try again.";
    }
  }

  Future<WeatherDaily> getWeatherDaily({required String city}) async {
    try {
      final http.Response response = await http.get(search(
        search: city,
      ));
      final json = jsonDecode(response.body);

      final Uri requestUri = weatherHourly(
        lat: json['coord']['lat'].toString(),
        lon: json['coord']['lon'].toString(),
      );

      final http.Response responseH = await http.get(requestUri);
      if (responseH.statusCode == 200) {
        final Map<String, dynamic> jsonString = jsonDecode(responseH.body);
        return WeatherDaily.fromMap(jsonString);
      } else {
        return throw Exception('Failed to load data weather');
      }
    } on SocketException catch (e) {
      print(e);
      throw "You don't have connection, try again later.";
    } catch (e) {
      print(e);
      throw "Unknown error, try again.";
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'assets/icons/thunderstorm.png'; //'🌩'
    } else if (condition < 400) {
      return 'assets/icons/drizzle.png'; //'🌧'
    } else if (condition < 600) {
      return 'assets/icons/rain.png'; //'☔️';
    } else if (condition < 700) {
      return 'assets/icons/snow.png'; //'☃️';
    } else if (condition < 800) {
      return 'assets/icons/dust.png'; //'🌫';
    } else if (condition == 800) {
      return 'assets/icons/clear_sky.png'; //'☀️'
    } else if (condition <= 804) {
      return 'assets/icons/clouds.png'; //'☁️';
    } else {
      return 'assets/icons/Confused.png'; //'🤷‍';
    }
  }
}
