class WeatherModel {
  final String cityName;
  final DateTime date;
  // final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final int humidity;

  WeatherModel({
    required this.cityName,
    required this.date,
    // this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.humidity,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['location']['localtime']),
      // image: json['current']['condition']['icon'],
      temp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['current']['condition']['text'],
      humidity: json['current']['humidity'],
    );
  }

  factory WeatherModel.fromJsonForecast(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']?['name'] ?? 'Unknown Location',
      date: DateTime.parse(json['date'] ?? DateTime.now().toString()),
      temp: (json['day']?['avgtemp_c'] ?? 0.0).toDouble(),
      maxTemp: (json['day']?['maxtemp_c'] ?? 0.0).toDouble(),
      minTemp: (json['day']?['mintemp_c'] ?? 0.0).toDouble(),
      weatherCondition: json['day']?['condition']?['text'] ?? 'Unknown',
      humidity: (json['day']?['avghumidity'] ?? 0).toInt(),
    );
  }
}
