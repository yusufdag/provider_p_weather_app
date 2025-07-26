import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_bloc/widget/transitive_background_color.dart';
import 'package:provider/provider.dart';

import '../viewmodels/mytheme_view_model.dart';
import '../viewmodels/weather_view_model.dart';
import 'humidity_and_cloud.dart';
import 'location.dart';
import 'refresh.dart';
import 'weather_picture.dart';

class WeatherArrivedErrorSolution extends StatefulWidget {
  const WeatherArrivedErrorSolution({super.key});

  @override
  State<WeatherArrivedErrorSolution> createState() => _WeatherArrivedErrorSolutionState();
}

class _WeatherArrivedErrorSolutionState extends State<WeatherArrivedErrorSolution> {

  late WeatherViewModel _weatherViewModel;
  Completer<void> _refreshIndicator = Completer<void>();

  @override
  void initState() {
    super.initState();
    _refreshIndicator = Completer<void>();
    debugPrint("WeatherArrivedErrorSolution initState triggered");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var weatherPicture = Provider.of<WeatherViewModel>(context, listen: false).getWeatherIcon();
      debugPrint("Weather Picture: $weatherPicture");
      Provider.of<MyThemeViewModel>(context, listen: false).changeTheme(weatherPicture);
      
    });
    
  }

  @override
  Widget build(BuildContext context) {

    debugPrint("WeatherArrivedErrorSolution build triggered");


    _refreshIndicator.complete();
    _refreshIndicator = Completer<void>();

    _weatherViewModel = Provider.of<WeatherViewModel>(context);
    String? userSelectedCity = _weatherViewModel.broughtWeather.location?.name;

    return TransitiveColorContainer(
      color: Provider.of<MyThemeViewModel>(context).myTheme.color,
      child: RefreshIndicator(
        onRefresh: () async {
          _weatherViewModel.updateWeather(userSelectedCity);
          return _refreshIndicator.future;
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: LocationWidget(selectedCity: userSelectedCity!),
              ), //Location Widget
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RefreshWidget(),
              ), //Last Update Widget // Parameterless Usage
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: WeatherPictureWidget()), //Last Update Widget
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                // We wrote the brought weather conditions as parameters.
                child: HumidityAndCloudWidget(
                  currentWeather: _weatherViewModel.broughtWeather.current,
                ), //Humidity and Cloud Widget
              ), //Last Update Widget
            ),
          ],
        ),
      ),
    );
  }
}