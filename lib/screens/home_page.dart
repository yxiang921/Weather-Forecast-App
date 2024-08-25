import 'package:flutter/material.dart';
import 'package:weather_app/models/hourly_weather_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather.dart';

import 'package:weather_app/widgets/main_info.dart';
import 'package:weather_app/widgets/hourly_weather.dart';
import 'package:weather_app/widgets/additional_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService = WeatherService();
  late Future<Weather> _weather;
  late Future<List<HourlyWeather>> _hourlyWeather;

  @override
  void initState() {
    super.initState();
    _weather = _weatherService.fetchWeatherApi();
    _hourlyWeather = _weatherService.fetchHourlyWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 72, 174, 255),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _weather,
        builder: (BuildContext ctx, AsyncSnapshot<Weather> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Opps, Somethings went wrong..."),
            );
          } else if (snapshot.hasData) {
            return Container(
              color: const Color.fromARGB(255, 72, 174, 255),
              child: Column(
                children: [
                  MainInfo(
                    weather: snapshot.data!,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      color: const Color.fromARGB(255, 72, 174, 255),
                      alignment: Alignment.centerLeft,
                      child: Card(
                        color: Color.fromARGB(255, 72, 174, 255),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 16),
                              child: const Text(
                                "Weather Forecast",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FutureBuilder<List<HourlyWeather>>(
                              future: _hourlyWeather,
                              builder: (ctx, hourlySnapshot) {
                                if (hourlySnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (hourlySnapshot.hasError) {
                                  return const Center(
                                    child:
                                        Text("Opps, Somethings went wrong..."),
                                  );
                                } else if (hourlySnapshot.hasData) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: hourlySnapshot.data!
                                          .map((hourlyWeather) =>
                                              HourlyForecastWidget(
                                                icon: hourlyWeather.icon,
                                                hourlyTime: hourlyWeather
                                                    .dateTime.hour
                                                    .toString(),
                                                temperature:
                                                    hourlyWeather.temperature,
                                              ))
                                          .toList(),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child:
                                        Text("Opps, Somethings went wrong..."),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AdditionalInfo(weather: snapshot.data!),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Opps, Somethings went wrong..."),
            );
          }
        },
      ),
    );
  }
}
