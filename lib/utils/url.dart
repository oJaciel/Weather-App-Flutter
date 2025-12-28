import 'package:flutter_dotenv/flutter_dotenv.dart';

class Url {
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  static String get BASE_URL => 'https://api.hgbrasil.com/weather?key=$apiKey';
}
