import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatefulWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);

  final WeatherModel weather;

  @override
  State<WeatherInfoBody> createState() => _WeatherInfoBodyState();
}

class _WeatherInfoBodyState extends State<WeatherInfoBody> {
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(weatherModel.weatherCondition),
        getThemeColor(weatherModel.weatherCondition)[300]!,
        getThemeColor(weatherModel.weatherCondition)[50]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'last update at :  ${weatherModel.date.hour} : ${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weatherModel.image!,
                  scale: 0.4,
                ),
                Text(
                  weatherModel.temp.ceil().toString() + ' °C',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Max Temp : ' +
                          weatherModel.maxTemp.ceil().toString() +
                          ' °C',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Min Temp : ' +
                          weatherModel.minTemp.ceil().toString() +
                          ' °C',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            // const SizedBox(height: 32),
            // ElevatedButton(
            //     onPressed: () {
            //       weatherModel.image;
            //     },
            //     child: const Text('this week forcast'))
          ],
        ),
      ),
    );
  }
}
