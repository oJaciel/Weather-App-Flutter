import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //API Key
  final _weatherService = WeatherService('44c441eb96db47d2e9498d48c0dcea5c');
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

  //Animações conforme clima
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sun.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sun.json';
      default:
        return 'assets/sun.json';
    }
  }

  //Estado inicial
  @override
  void initState() {
    super.initState();

    //Buscar o clima ao iniciar
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Nome da Cidade
            Text(_weather?.cityName ?? "Carregando cidade"),

            //Animação
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            //Temperatura
            Text('${_weather?.temperature.round()}°C'),

            //Clima
            Text(_weather?.mainCondition ?? ""),
          ],
        ),
      ),
    );
  }
}
