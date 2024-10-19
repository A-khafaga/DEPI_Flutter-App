
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) async {
        var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
        getWeatherCubit.getWeather(cityName: value);
        weatherModel =
            await WeatherService(Dio()).getCurrentWeather(cityName: value);
        log(weatherModel!.cityName);
        Navigator.pop(context);
      },
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        hintText: 'Search here...',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Color(0xFF838BAA),
        ),
      ),
    );
  }
}
