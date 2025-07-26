import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/weather_view_model.dart';

class WeatherPictureWidget extends StatelessWidget {
  const WeatherPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var weatherPic = _weatherViewModel.broughtWeather.current!.condition!.icon;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          " ${_weatherViewModel.broughtWeather.current?.tempC?.floor().toString()} °C",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        if (_weatherViewModel.broughtWeather.current?.condition?.icon != null)
          Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https:$weatherPic",
              ),
              fit: BoxFit.contain,
            ),
          ),
        )

        
      ], 
    );
  }
}