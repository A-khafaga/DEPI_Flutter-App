import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/forecast_title.dart';
import 'package:weather_app/widgets/next_forecast_item.dart';
import 'package:weather_app/widgets/forecast_list_view.dart';

class ForecastReportViewBody extends StatelessWidget {
  const ForecastReportViewBody({super.key, required this.forecastList});
  final List<WeatherModel> forecastList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ForecastTitle(model: forecastList.first),
        ),
        SliverToBoxAdapter(
          child: ForecastListView(forecastList: forecastList),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Next Forecast",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return NextForecastItem(weather: forecastList[index]);
            },
            childCount: forecastList.length,
          ),
        ),
      ],
    );
  }
}
