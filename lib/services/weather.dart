import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/hourly_weather_model.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String apiKey = 'ec18c3f6cc7f715638bfbd94e1ef9cfd';
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/forecast';

  Future<Weather> fetchWeatherApi(String city) async {
    print('API LINK: $apiUrl?q=$city&appid=$apiKey&units=metric');

    final reponses = await http.get(
      Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'),
    );

    if (reponses.statusCode == 200) {
      print('API RESPONSE: ${reponses.body}');
      return Weather.fromJson(jsonDecode(reponses.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<HourlyWeather>> fetchHourlyWeather(String city) async {
    final reponses = await http.get(
      Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'),
    );

    if (reponses.statusCode == 200) {
      final List<dynamic> list = jsonDecode(reponses.body)['list'];
      return list.map((item) => HourlyWeather.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
