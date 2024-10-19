part of 'get_weather_forecast_cubit.dart';

@immutable
sealed class GetWeatherForecastState {}

final class GetWeatherForecastInitial extends GetWeatherForecastState {}

class WeatherForecastLoadedState extends GetWeatherForecastState {
  final List<WeatherModel> forecastList;
  WeatherForecastLoadedState(this.forecastList);
}

class WeatherForecastFailureState extends GetWeatherForecastState {
  final String errMessage;
  WeatherForecastFailureState(this.errMessage);
}
