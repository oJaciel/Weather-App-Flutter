import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/url.dart';

class WeatherProvider with ChangeNotifier {
  Weather weatherModel = Weather();
  Weather get weather => weatherModel;

  List<Forecast> forecastList = [];
  List<Forecast> get forecast => [...forecastList];

  Future<void> getWeather() async {
    final res = await http.get(Uri.parse(Url.BASE_URL));

    weatherModel = Weather.fromJson(jsonDecode(res.body));
    notifyListeners();
  }

  Future<void> getForecast() async {
    final res = await http.get(Uri.parse(Url.BASE_URL));

    final data = jsonDecode(res.body);
    final List<dynamic> results = data['results']['forecast'];

    forecastList.clear();

    for (var item in results) {
      forecastList.add(Forecast.fromJson(item));
    }
    notifyListeners();
  }
}
