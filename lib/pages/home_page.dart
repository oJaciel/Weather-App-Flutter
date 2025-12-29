import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<WeatherProvider>();
      provider.getWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();
    final weather = provider.weather;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => provider.getWeather(),
        child: ListView(
          physics:
              const AlwaysScrollableScrollPhysics(),
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(weather.city ?? 'Carregando...'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}