class Weather {
  final int? temp;
  final String? date;
  final String? time;
  final String? condition_code;
  final String? description;
  final String? currently;
  final int? woeid;
  final String? city;
  final String? img_id;
  final int? humidity;
  final double? cloudiness;
  final double? rain;
  final String? wind_speedy;
  final int? wind_direction;
  final String? wind_cardinal;
  final String? sunrise;
  final String? sunset;
  final String? moon_phase;
  final String? condition_slug;
  final String? city_name;
  final String? timezone;

  Weather({
    this.temp,
    this.date,
    this.time,
    this.condition_code,
    this.description,
    this.currently,
    this.woeid,
    this.city,
    this.img_id,
    this.humidity,
    this.cloudiness,
    this.rain,
    this.wind_speedy,
    this.wind_direction,
    this.wind_cardinal,
    this.sunrise,
    this.sunset,
    this.moon_phase,
    this.condition_slug,
    this.city_name,
    this.timezone,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['results']['temp'],
      date: json['results']['date'],
      time: json['results']['time'],
      condition_code: json['results']['condition_code'],
      description: json['results']['description'],
      currently: json['results']['currently'],
      woeid: json['results']['woeid'],
      city: json['results']['city'],
      img_id: json['results']['img_id'],
      humidity: json['results']['humidity'],
      cloudiness: json['results']['cloudiness'],
      rain: json['results']['rain'],
      wind_speedy: json['results']['wind_speedy'],
      wind_direction: json['results']['wind_direction'],
      wind_cardinal: json['results']['wind_cardinal'],
      sunrise: json['results']['sunrise'],
      sunset: json['results']['sunset'],
      moon_phase: json['results']['moon_phase'],
      condition_slug: json['results']['condition_slug'],
      city_name: json['results']['city_name'],
      timezone: json['results']['timezone'],
    );
  }
}
