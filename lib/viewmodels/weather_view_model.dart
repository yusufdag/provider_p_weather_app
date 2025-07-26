// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_weatherapp_with_bloc/data/weather_repository.dart';

import '../locator.dart';
import '../models/weather.dart';

enum WeatherState {
  initialWeatherState,
  weatherLoadingState,
  weatherLoadedState,
  weatherErrorState,
}

class WeatherViewModel with ChangeNotifier {

  WeatherState _state = WeatherState.initialWeatherState;
  WeatherRepository _repository = locator<WeatherRepository>();
  Weather _broughtWeather;

  WeatherViewModel(
    this._state,
    this._broughtWeather,
  );

  Weather get broughtWeather => _broughtWeather;

  WeatherState get state => _state;

  set state(WeatherState newState) {
    _state = newState;
    _broughtWeather = broughtWeather; // Update the broughtWeather when state changes
    notifyListeners();
  }

  Future<Weather> bringWeather(String cityName) async { //Hava durumunu getir 
  
    try {
      state = WeatherState.weatherLoadingState; // Hava durumu yükleniyor durumu
      _broughtWeather = await _repository.getWeather(cityName);
      state = WeatherState.weatherLoadedState; // Hava durumu başarıyla yüklendi
    } catch (e) {
      state = WeatherState.weatherErrorState; // Hata durumu

    }
    return _broughtWeather; // Hava durumu başarıyla getirildiğinde

  }

  Future<Weather> updateWeather(String cityName) async { //Hava durumunu getir 
  
    try {
      _broughtWeather = await _repository.getWeather(cityName);
      state = WeatherState.weatherLoadedState; // Hava durumu başarıyla yüklendi
    } catch (e) {
      state = WeatherState.weatherErrorState; // Hata durumu
    }
    return _broughtWeather; // Hava durumu başarıyla getirildiğinde

  }
  
  String getWeatherIcon() {
    return _broughtWeather.current?.condition?.text ?? "Unknown"; // Default icon if not available
  }
  

}
