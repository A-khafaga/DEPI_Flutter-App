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
  bool isCelsius = true;
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
                  isCelsiusText(model.temp),
                  style: const TextStyle(color: Colors.white, fontSize: 100),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Min: ' "${isCelsiusText(model.minTemp)}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      'Max: ' "${isCelsiusText(model.maxTemp)}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  model.weatherCondition,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Wind:\t ${model.humidity} km/h",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "Humidity:\t ${model.humidity}%",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isCelsius
                        ? Colors.lightBlue.shade400 // Blueish tone for °C
                        : Colors.orange.shade400, // Warm tone for °F
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black26,
                  ),
                  onPressed: () {
                    setState(() {
                      isCelsius = !isCelsius;
                    });
                  },
                  child: Text(
                    isCelsius ? 'Convert to °F' : 'Convert to °C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  String isCelsiusText(double temperature) {
    return isCelsius
        ? "${temperature.ceil()}°C"
        : "${celsiusToFahrenheit(temperature).ceil()}°F";
  }
}
