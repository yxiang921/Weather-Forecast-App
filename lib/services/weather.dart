import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:weather_app/models/hourly_weather_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/get_location.dart';

class WeatherService {
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/forecast';

  Future<Weather> fetchWeatherApi() async {
    LocationService locationService = LocationService();
    final position = await locationService.getCurrentLocation();
    print('Location: ${position.latitude}, ${position.longitude}');

    final reponses = await http.get(
      Uri.parse(
          '$apiUrl?appid=$apiKey&units=metric&lat=${position.latitude}&lon=${position.longitude}'),
    );

    print(
        "URL: $apiUrl?appid=$apiKey&units=metric&lat=${position.latitude}&lon=${position.longitude}");

    if (reponses.statusCode == 200) {
      print('API RESPONSE: ${reponses.body}');
      return Weather.fromJson(jsonDecode(reponses.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<HourlyWeather>> fetchHourlyWeather() async {
    LocationService locationService = LocationService();
    final position = await locationService.getCurrentLocation();
    final reponses = await http.get(
      Uri.parse(
          '$apiUrl?appid=$apiKey&units=metric&lat=${position.latitude}&lon=${position.longitude}'),
    );

    if (reponses.statusCode == 200) {
      final List<dynamic> list = jsonDecode(reponses.body)['list'];
      return list.map((item) => HourlyWeather.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
