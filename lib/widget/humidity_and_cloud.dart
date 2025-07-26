import 'package:flutter/material.dart';

import '../models/weather.dart';

class HumidityAndCloudWidget extends StatelessWidget {
  HumidityAndCloudWidget({super.key, required this.currentWeather});

  Current? currentWeather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Humidity: ${currentWeather?.humidity?.floor().toString() ?? 0}%',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        Text(
          'Cloud: ${currentWeather?.cloud?.floor().toString() ?? 0}%',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
