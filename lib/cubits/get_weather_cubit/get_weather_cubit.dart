import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/utils/determine_position.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;

  getWeather({String? cityName}) async {
    try {
      if (cityName == null) {
        Position position = await determinePosition();
        // Use the coordinates to get city name or directly pass coordinates to the API.
        // Here, we are assuming you can pass latitude and longitude to the API.
        final latitude = position.latitude;
        final longitude = position.longitude;

        weatherModel = await WeatherService(Dio())
            .getCurrentWeatherByCoordinates(lat: latitude, lon: longitude);
      } else {
        weatherModel =
            await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      }
      emit(WeatherLoadedState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
