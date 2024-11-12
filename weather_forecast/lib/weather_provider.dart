import 'package:flutter/material.dart';
import 'weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? currentWeather;
  List<dynamic>? forecast;

  Future<void> getCurrentWeather(String city) async {
    currentWeather = await _weatherService.fetchCurrentWeather(city);
    notifyListeners();
  }

  Future<void> getForecast(String city) async {
    forecast = await _weatherService.fetchForecast(city);
    notifyListeners();
  }
}
