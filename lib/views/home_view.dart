import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/core/custom/custom_app_bar.dart';
import 'package:weather_app/core/custom/custom_gradient_background.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/forecast_report_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String cityName = "";
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetWeatherCubit>(context).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(context, cityName: cityName),
      body: CustomGradientBackground(
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadedState) {
              cityName = state.weatherModel.cityName;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {});
              });
              return WeatherInfoBody(weather: state.weatherModel);
            } else if (state is WeatherFailureState) {
              log(state.errMessage);
              return Center(child: Text(state.errMessage));
            } else {
              return const NoWeatherBody();
            }
          },
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ForecastReportView();
                },
              ),
            );
          },
          backgroundColor: Colors.white,
          label: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forecast report",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0XFF444E72),
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.arrow_drop_up,
                color: Color(0xFF444E72),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
