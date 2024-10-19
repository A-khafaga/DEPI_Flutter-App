import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_forecast_cubit/get_weather_forecast_cubit.dart';
import 'package:weather_app/widgets/forecast_report_bloc_builder.dart';

class ForecastReportView extends StatelessWidget {
  const ForecastReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherForecastCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Back",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const ForecastReportBlocBuilder(),
      ),
    );
  }
}
