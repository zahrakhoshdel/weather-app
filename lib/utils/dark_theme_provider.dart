import 'package:flutter/foundation.dart';
import 'package:weather_app/utils/devpreferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DevPreferences devPreferences = DevPreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    devPreferences.setDarkTheme(value);
    notifyListeners();
  }
}
