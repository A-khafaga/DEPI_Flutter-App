import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/images_date.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/views/home_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black12,
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const HomeView();
                        },
                      ),
                    );
                  },
                ),
                const Expanded(
                  child: CustomSearchBar(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Image.asset(ImagesDate.map),
        ],
      ),
    );
  }
}

// WeatherModel? weatherModel;

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
