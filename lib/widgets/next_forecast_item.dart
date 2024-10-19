import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/images_date.dart';
import 'package:weather_app/models/weather_model.dart';

class NextForecastItem extends StatelessWidget {
  const NextForecastItem({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('MMM, d').format(weather.date),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Image.asset(
            getWeatherImage(weather.weatherCondition),
            height: 40,
          ),
          const Spacer(),
          Text(
            '${weather.temp}°',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
