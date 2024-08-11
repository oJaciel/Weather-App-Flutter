import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //API Key
  final _weatherService = WeatherService('3fe60800f4957e1f1345c85c63a85e90');
  Weather? _weather;

  //Buscar clima
  _fetchWeather() async {
    //Buscar cidade atual
    String cityName = await _weatherService.getCurrentCity();

    //Buscar clima da cidade
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    //Se tiver erro
    catch (e) {
      print(e);
    }
  }

  //Animações de clima

  //Estado inicial
  @override
  void initState() {
    super.initState();

    //Buscar o clima ao iniciar
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
