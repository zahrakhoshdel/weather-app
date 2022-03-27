class SysInfo {
  final String country;
  final int sunrise;
  final int sunset;

  SysInfo({required this.country, required this.sunrise, required this.sunset});

  factory SysInfo.fromJson(Map<String, dynamic> json) {
    final country = json['country'];
    final sunrise = json['sunrise'];
    final sunset = json['sunset'];
    return SysInfo(country: country, sunrise: sunrise, sunset: sunset);
  }
}

class WeatherInfo {
  final int id;
  final String description;
  final String icon;

  WeatherInfo(
      {required this.id, required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon, id: id);
  }
}

class WindInfo {
  final double windspeed;

  WindInfo({required this.windspeed});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final windspeed = json['speed'];

    return WindInfo(windspeed: windspeed);
  }
}

class MainInfo {
  final double temperature;
  final int humidity;
  final int pressure;

  MainInfo(
      {required this.temperature,
      required this.humidity,
      required this.pressure});

  factory MainInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final humidity = json['humidity'];
    final pressure = json['pressure'];
    return MainInfo(
        temperature: temperature, humidity: humidity, pressure: pressure);
  }
}

class Weather {
  final String cityName;
  final MainInfo mainInfo;
  final WeatherInfo weatherInfo;
  final SysInfo sysInfo;
  final WindInfo windInfo;

  Weather({
    required this.cityName,
    required this.mainInfo,
    required this.weatherInfo,
    required this.sysInfo,
    required this.windInfo,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final windJson = json['wind'];
    final windInfo = WindInfo.fromJson(windJson);

    final sysJson = json['sys'];
    final sysInfo = SysInfo.fromJson(sysJson);

    final mainJson = json['main'];
    final mainInfo = MainInfo.fromJson(mainJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return Weather(
      cityName: cityName,
      mainInfo: mainInfo,
      weatherInfo: weatherInfo,
      sysInfo: sysInfo,
      windInfo: windInfo,
    );
  }
}
