import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_bloc/widget/weather_arrived_regularbuilderror_solution.dart';
import 'package:provider/provider.dart';

import '../viewmodels/mytheme_view_model.dart';
import '../viewmodels/weather_view_model.dart';
import 'location.dart';
import 'humidity_and_cloud.dart';
import 'refresh.dart';
import 'select_city.dart';
import 'weather_picture.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  String userSelectedCity = "Ankara"; // Default city
  late WeatherViewModel _weatherViewModel;
  

  @override
  Widget build(BuildContext context) {
    _weatherViewModel = Provider.of<WeatherViewModel>(context);


    return Consumer<MyThemeViewModel>(
      builder: (context, MyThemeViewModel myThemeViewModel, child) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: myThemeViewModel.myTheme.theme.primaryColor,
          title: const Text('Weather App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                userSelectedCity = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectCityWidget(),
                  ),
                );
                //debugPrint("Selected City: $userSelectedCity");
                _weatherViewModel.bringWeather(userSelectedCity);
              },
            ),
          ],
        ),
        body: Center(
          child: (_weatherViewModel.state == WeatherState.weatherLoadedState)
              ? WeatherArrivedErrorSolution()
              : (_weatherViewModel.state == WeatherState.weatherLoadingState)
              ? weatherBeingBrought()
              : (_weatherViewModel.state == WeatherState.weatherErrorState)
              ? weatherArrivedError()
              : Text("Select City!"),
        ),
      ),
    );
  }

  //Hatalı 
  /* Widget weatherArrived(BuildContext context) {

    debugPrint("Weather arrived triggered");

    String? userSelectedCity = _weatherViewModel.broughtWeather.location?.name;

    // Future.delayed is used to simulate a delay for the theme change
    Future.delayed(const Duration(milliseconds: 200), () {
      var arrivedWeatherText = _weatherViewModel.getWeatherIcon();
      _myThemeViewModel?.changeTheme(arrivedWeatherText);
    });

    _refreshIndicator.complete();
    _refreshIndicator = Completer<void>();

    return WeatherArrivedErrorSolution();
  } */

  weatherBeingBrought() {
    return CircularProgressIndicator();
  }

  weatherArrivedError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, color: Colors.red, size: 50),
        SizedBox(height: 10),
        Text(
          'Error fetching weather',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ],
    );
  }
}
