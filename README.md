<h1 align="center">Flutter Weather App 🌦️</h1>

> A weather App created using **[Flutter](https://github.com/flutter/flutter)** and **[Dart](https://dart.dev/)** and using API from **[OpenWeatherMap](https://openweathermap.org/)**

## Table of Contents

* [Demo](#demo)
* [Screenshots](#screenshots)
* [Features](#features)
* [Packages In Use](#packages-in-use)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Show Your Support](#show-your-support)
* [Author](#author)

## Demo

Demo Video


https://user-images.githubusercontent.com/91828519/160483013-d8f6e32c-50bb-4cf4-ad3d-f9b368d1c42d.mp4


## 🚀 See Screenshots

<details>
<summary>See ScreenShots</summary>
 <img src="https://github.com/zahrakhoshdel/weather-app/blob/main/screenshots/home_light.png" alt="Lhome-screen" width="200"></img>
 <img src="https://github.com/zahrakhoshdel/weather-app/blob/main/screenshots/search_light.png" alt="Lsearch-screen" width="200"></img>
 <img src="https://github.com/zahrakhoshdel/weather-app/blob/main/screenshots/forecast_light.png" alt="Lforecast-screen" width="200"></img>
 <img src="https://github.com/zahrakhoshdel/weather-app/blob/main/screenshots/setting_light.png" alt="Lsetting-screen" width="200"></img>
 
 <img src="https://github.com/zahrakhoshdel/weather-app/blob/main/screenshots/home_dark.png" alt="Dhome-screen" width="200"></img>
 <img src="https://github.com/zahrakhoshdel/weather-app/blob/main/screenshots/search_dark.png" alt="sDearch-screen" width="200"></img>
 <img src="https://github.com/zahrakhoshdel/weather-app/blob/main/screenshots/forecast_dark.png" alt="Dforecast-screen" width="200"></img>
 <img src="https://github.com/zahrakhoshdel/weather-app/blob/main/screenshots/setting_dark.png" alt="Dsetting-screen" width="200"></img>
</details>

## Features

- :white_check_mark: Beautiful UI
- :white_check_mark: Dark and Light themes
- :white_check_mark: Current weather: current temperature, humidity, wind speed, sunrise
- :white_check_mark: 12-hour weather forecast
- :white_check_mark: 7-day weather forecast
- :white_check_mark: Search weather by city
- :white_check_mark: Custom icons for each weather condition
- :white_check_mark: Null safety

## Packages In Use

- [http](https://pub.dev/packages/http) 
- [intl](https://pub.dev/packages/intl)
- [provider](https://pub.dev/packages/provider)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [flutter_spinkit](https://pub.dev/packages/flutter_spinkit)
    
## Getting Started

To get a local copy up and running follow these simple steps.


### Prerequisites
You need to have **Flutter** installed on your pc.
* [Install Flutter](https://flutter.dev/docs/get-started/install)
* [Dart Sdk](https://dart.dev/get-dart#install)
* [OpenWeather API Key](https://home.openweathermap.org/api_keys)

**Note**: to use the API you'll need to register an account and obtain your own API key.

> Create an account at OpenWeatherMap.
> Then get your API key from [OpenWeatherAPI](https://home.openweathermap.org/api_keys).

### Installation

1. Clone the repo.
    ```sh
     git clone https://github.com/zahrakhoshdel/weather-app
    ```
2. Install packages.
    ```sh
     flutter pub get
    ```
3. Add OpenWeatherMap API KEY on `lib/data_service.dart`
  ```dart
  static const String API_KEY = 'Enter Your API key';
  ```

4. Run project.
    ```sh
     flutter run
    ```

## Show Your Support

> Feel free to star ⭐ this repository, if you like what you see.

## Author

👤 **Zahra Khoshdel**

- Github: [@zahrakhoshdel](https://github.com/zahrakhoshdel "zahrakhoshdel")


