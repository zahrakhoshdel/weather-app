// ignore_for_file: non_constant_identifier_names

class WeatherDaily {
  List<Daily> list;
  WeatherDaily.fromMap(Map<String, dynamic> json)
      : list = List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x)));
}

class Daily {
  final int td;
  final int temp_day;
  final int temp_night;
  final int id;
  final String icon;
  final String description;
  final double windspeed;

  Daily.fromMap(Map<String, dynamic> json)
      : td = json['dt'].toInt(),
        temp_day = json['temp']['day'].toInt(),
        temp_night = json['temp']['night'].toInt(),
        id = json['weather'][0]['id'],
        icon = json['weather'][0]['icon'],
        description = json['weather'][0]['description'],
        windspeed = json['wind_speed'].toDouble();
}
