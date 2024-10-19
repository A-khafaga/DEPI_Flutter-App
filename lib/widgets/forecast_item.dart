import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/images_date.dart';
import 'package:weather_app/models/weather_model.dart';

class ForecasttItem extends StatelessWidget {
  const ForecasttItem({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${weather.maxTemp}°C',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            getWeatherImage(weather.weatherCondition),
            height: 60,
          ),
          const SizedBox(height: 10),
          Text(
            '${weather.minTemp}°C',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
