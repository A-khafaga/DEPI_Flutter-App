import 'dart:developer';
import 'package:weather_app/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '236102bd01fb421eb0e203004241609&q';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await Dio()
          .get('$baseUrl/forecast.json?key=$apiKey=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops, there was an error, try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Try again later');
    }
  }

  Future<WeatherModel> getCurrentWeatherByCoordinates({
    required double lat,
    required double lon,
  }) async {
    try {
      Response response = await Dio().get(
        '$baseUrl/forecast.json?key=$apiKey&q=$lat,$lon&days=1',
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, there was an error, try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Try again later');
    }
  }
}
