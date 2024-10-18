import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/images_date.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatefulWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;

  @override
  State<WeatherInfoBody> createState() => _WeatherInfoBodyState();
}

class _WeatherInfoBodyState extends State<WeatherInfoBody> {
  @override
  Widget build(BuildContext context) {
    final model = widget.weather;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 130),
        Image.asset(getWeatherImage(model.weatherCondition)),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 50),
          width: 350,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Today, ${DateFormat('d MMMM').format(model.date)}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "${model.temp.ceil()}°",
                  style: const TextStyle(color: Colors.white, fontSize: 100),
                ),
                Text(
                  model.weatherCondition,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 25),
                Text(
                  "Wind:\t ${model.humidity} km/h",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Humidity:\t ${model.humidity}%",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
