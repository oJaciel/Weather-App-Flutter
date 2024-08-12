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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //Nome da Cidade
          Text(_weather?.cityName ?? "Carregando cidade"),
        
          //Temperatura
          Text('${_weather?.temperature.round()}°C')
        
        ],),
      ),
    );
  }
}
