import 'package:flutter/material.dart';

import '../models/my_theme.dart';

class MyThemeViewModel with ChangeNotifier {
  late MyTheme _myTheme;

  MyThemeViewModel() {
    _myTheme = MyTheme(Colors.blue, ThemeData.light());
  }

  MyTheme get myTheme => _myTheme;

  set myTheme(MyTheme value) {
    _myTheme = value;
    notifyListeners();
  }

  void changeTheme(var weatherText) {
    MyTheme _temporaryTheme = MyTheme(Colors.blue, ThemeData.light());

    switch (weatherText) {
      case 'Partly cloudy':
      case 'Rainy':
      case 'Cloudy':
      case 'Overcast':
      case 'Drizzle':
      case 'Mist':
      case 'Fog':
      case 'Haze':
      case 'Smoke':
      case 'Dust':
      case 'Sand':
      case 'Ash':
      case 'Squalls':
      case 'Tornado':
      case 'Blowing snow':
      case 'Snow':
      case 'Sleet':
      case 'Freezing rain':
      case 'Ice pellets':
      case 'Light rain':
      case 'Heavy rain':
      case 'Light snow':
      case 'Heavy snow':
      case 'Light sleet':
      case 'Heavy sleet':
      case 'Light freezing rain':
      case 'Heavy freezing rain':
      case 'Patchy rain nearby':
      
        _temporaryTheme = MyTheme(
          Colors.grey,
          ThemeData(primaryColor: Colors.blueGrey),
        );
        break;
      case 'Sunny':
      case 'Clear':
      case 'Fair':
      case 'Hot':
        _temporaryTheme = MyTheme(
          Colors.yellow,
          ThemeData(primaryColor: Colors.orangeAccent),
        );
        break;
    }

    myTheme = _temporaryTheme;
    

  }

  void updateTheme(String weatherPicture) {}
}
