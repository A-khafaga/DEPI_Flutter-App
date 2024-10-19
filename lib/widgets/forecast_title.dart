import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class ForecastTitle extends StatelessWidget {
  const ForecastTitle({
    super.key,
    required this.model,
  });

  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Today",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        Text(
          DateFormat('MMM, d').format(model.date),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
