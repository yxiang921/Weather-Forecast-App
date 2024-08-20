class HourlyWeather {
  final DateTime dateTime;
  final String icon;
  final String temperature;

  HourlyWeather({
    required this.dateTime,
    required this.icon,
    required this.temperature,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      icon: json['weather'][0]['icon'],
      temperature: json['main']['temp'].toString(),
    );
  }
}
