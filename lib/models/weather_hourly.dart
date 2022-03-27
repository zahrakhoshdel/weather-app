class WeatherHourly {
  List<Hourly> list;
  WeatherHourly.fromMap(Map<String, dynamic> json)
      : list = List<Hourly>.from(json["hourly"].map((x) => Hourly.fromMap(x)));
}

class Hourly {
  final int td;
  final int temp;
  final int pressure;
  final int humidity;
  final int id;
  final String icon;
  final String description;
  final double windspeed;
  final int visibility;
  Hourly.fromMap(Map<String, dynamic> json)
      : td = json['dt'].toInt(),
        temp = json['temp'].toInt(),
        pressure = json['pressure'].toInt(),
        humidity = json['humidity'].toInt(),
        id = json['weather'][0]['id'],
        icon = json['weather'][0]['icon'],
        description = json['weather'][0]['description'],
        windspeed = json['wind_speed'].toDouble(),
        visibility = json['visibility'];
}
