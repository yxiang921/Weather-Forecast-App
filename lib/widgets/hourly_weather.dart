import 'package:flutter/material.dart';

class HourlyForecastWidget extends StatelessWidget {
  final String hourlyTime;
  final String icon;
  final String temperature;

  const HourlyForecastWidget(
      {super.key,
      required this.icon,
      required this.hourlyTime,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 130,
        height: 140,
        child: Card(
          color: const Color.fromARGB(255, 72, 174, 255),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$hourlyTime:00',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              Image.network(
                'https://openweathermap.org/img/wn/${icon}@2x.png',
                cacheHeight: 50,
              ),
              Text('$temperature°C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
