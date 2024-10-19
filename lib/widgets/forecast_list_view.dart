import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/forecast_item.dart';

class ForecastListView extends StatelessWidget {
  const ForecastListView({
    super.key,
    required this.forecastList,
  });

  final List<WeatherModel> forecastList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .26,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecastList.length,
        itemBuilder: (context, index) {
          final weather = forecastList[index];
          return ForecasttItem(weather: weather);
        },
      ),
    );
  }
}
