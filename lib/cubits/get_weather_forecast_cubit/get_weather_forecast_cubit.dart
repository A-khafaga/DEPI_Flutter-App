import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/utils/determine_position.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

part 'get_weather_forecast_state.dart';

class GetWeatherForecastCubit extends Cubit<GetWeatherForecastState> {
  GetWeatherForecastCubit() : super(GetWeatherForecastInitial());
  List<WeatherModel>? weatherModel;

  getForecastWeather() async {
    try {
      Position position = await determinePosition();
      final latitude = position.latitude;
      final longitude = position.longitude;
      weatherModel = await WeatherService(Dio())
          .getForecastWeatherByCoordinates(lat: latitude, lon: longitude);

      emit(WeatherForecastLoadedState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherForecastFailureState(e.toString()));
    }
  }
}
