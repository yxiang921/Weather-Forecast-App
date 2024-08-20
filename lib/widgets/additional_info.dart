import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/widgets/additional_info_card.dart';

class AdditionalInfo extends StatelessWidget {
  final Weather weather;

  const AdditionalInfo({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16),
          child: const Text('Additional Information',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AdditionalCard(
              icon: Icons.water_drop,
              label: 'Humidity',
              value: weather.humidity,
            ),
            AdditionalCard(
              icon: Icons.air,
              label: 'Wind Speed',
              value: weather.windSpeed,
            ),
            AdditionalCard(
                icon: Icons.beach_access,
                label: 'Pressure',
                value: weather.pressure),
          ],
        )
      ],
    );
  }
}
