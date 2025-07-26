import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/weather_view_model.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final _weatherViewModel = Provider.of<WeatherViewModel>(context);

    // var newTime = _weatherViewModel.broughtWeather.current?.lastUpdated ?? DateTime.now(); api kaynağından son güncelleme zamanını al

    return Text(
      'Last Update: ${TimeOfDay.now().format(context)}',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
      ),
    );
  }
}