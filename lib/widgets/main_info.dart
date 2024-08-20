import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class MainInfo extends StatelessWidget {
  final Weather weather;

  const MainInfo({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: const Color.fromARGB(165, 72, 174, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(weather.cityName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text('${weather.temperature}°C',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
              Image.network(
                'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                cacheHeight: 100,
              ),
              Text(toBeginningOfSentenceCase(weather.weatherDesc),
                  style: const TextStyle(color: Colors.white, fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
