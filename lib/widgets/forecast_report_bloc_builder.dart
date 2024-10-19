import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/custom/custom_gradient_background.dart';
import 'package:weather_app/cubits/get_weather_forecast_cubit/get_weather_forecast_cubit.dart';
import 'package:weather_app/widgets/forecast_report_view_body.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

class ForecastReportBlocBuilder extends StatefulWidget {
  const ForecastReportBlocBuilder({super.key});

  @override
  State<ForecastReportBlocBuilder> createState() =>
      _ForecastReportBlocBuilderState();
}

class _ForecastReportBlocBuilderState extends State<ForecastReportBlocBuilder> {
  @override
  void initState() {
    BlocProvider.of<GetWeatherForecastCubit>(context).getForecastWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomGradientBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: BlocBuilder<GetWeatherForecastCubit, GetWeatherForecastState>(
          builder: (context, state) {
            if (state is GetWeatherForecastInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherForecastLoadedState) {
              log("===> ${state.forecastList.length}");
              return ForecastReportViewBody(forecastList: state.forecastList);
            } else if (state is WeatherForecastFailureState) {
              return Center(child: Text(state.errMessage));
            } else {
              return const NoWeatherBody();
            }
          },
        ),
      ),
    );
  }
}
