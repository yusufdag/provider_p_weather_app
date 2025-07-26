import 'package:flutter_weatherapp_with_bloc/models/weather.dart';
import 'package:get_it/get_it.dart';


import 'data/weather_api_client.dart';
import 'data/weather_repository.dart';
import 'viewmodels/weather_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository()); // bir kere oluşturulur ve uygulama boyunca aynı nesne kullanılır
  // locator.registerFactory(() => WeatherRepository()); // her istekte bulunulduğunda yeni bir nesne oluşturur
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherViewModel(
    WeatherState.initialWeatherState,
    Weather(),
  ));
}