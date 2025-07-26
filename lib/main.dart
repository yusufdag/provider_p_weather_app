import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_bloc/viewmodels/mytheme_view_model.dart';

import 'package:provider/provider.dart';

import 'locator.dart';
import 'viewmodels/weather_view_model.dart';
import 'widget/weather_app.dart';

void main() {
  setupLocator(); // Initialize the service locator
  // Ensure Flutter is initialized before running the app
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyThemeViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyThemeViewModel>(
      builder: (BuildContext context, MyThemeViewModel myThemeViewModel, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: myThemeViewModel.myTheme.theme,
        home: ChangeNotifierProvider<WeatherViewModel>(
          create: (BuildContext context) {
            return locator<WeatherViewModel>();
          },
          child: WeatherApp(),
        ),
      ),
    );
  }
}
