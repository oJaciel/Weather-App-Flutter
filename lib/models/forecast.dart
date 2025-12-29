class Forecast {
  final String? date;
  final String? fullDate;
  final String? weekday;
  final int? max;
  final int? min;
  final int? humidity;
  final int? cloudiness;
  final double? rain;
  final int? rainProbability;
  final String? windSpeedy;
  final String? sunrise;
  final String? sunset;
  final String? moonPhase;
  final String? description;
  final String? condition;

  Forecast({
    this.date,
    this.fullDate,
    this.weekday,
    this.max,
    this.min,
    this.humidity,
    this.cloudiness,
    this.rain,
    this.rainProbability,
    this.windSpeedy,
    this.sunrise,
    this.sunset,
    this.moonPhase,
    this.description,
    this.condition,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: json['date'],
      fullDate: json['full_date'],
      weekday: json['weekday'],
      max: json['max'],
      min: json['min'],
      humidity: json['humidity'],
      cloudiness: (json['cloudiness'] as num?)?.toInt(),
      rain: (json['rain'] as num?)?.toDouble(),
      rainProbability: json['rain_probability'],
      windSpeedy: json['wind_speedy'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonPhase: json['moon_phase'],
      description: json['description'],
      condition: json['condition'],
    );
  }
}
