class Weather {
  final String cityName;
  final String temperature;
  final String weatherDesc;
  final String icon;

  final String humidity;
  final String windSpeed;
  final String pressure;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.weatherDesc,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['city']['name'],
      temperature: json['list'][2]['main']['temp'].toString(),
      weatherDesc: json['list'][2]['weather'][0]['description'],
      icon: json['list'][2]['weather'][0]['icon'],
      humidity: json['list'][2]['main']['humidity'].toString(),
      windSpeed: json['list'][2]['wind']['speed'].toString(),
      pressure: json['list'][2]['main']['pressure'].toString(),
    );
  }
}
