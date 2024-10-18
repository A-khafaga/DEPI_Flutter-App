class ImagesDate {
  static const String _mainPath = "assets/images";
  static const String clear = "$_mainPath/clear.png";
  static const String cloudy = "$_mainPath/cloudy.png";
  static const String rain = "$_mainPath/rainy.png";
  static const String snow = "$_mainPath/snow.png";
  static const String thunderstorm = "$_mainPath/thunderstorm.png";
  static const String map = "$_mainPath/map.png";
}

String getWeatherImage(String condition) {
  switch (condition.toLowerCase()) {
    case 'clear':
    case 'sunny':
      return ImagesDate.clear;
    case 'cloudy':
    case 'partly cloudy':
    case 'overcast':
      return ImagesDate.cloudy;
    case 'rain':
    case 'showers':
      return ImagesDate.rain;
    case 'snow':
      return ImagesDate.snow;
    case 'thunderstorm':
      return ImagesDate.thunderstorm;
    default:
      return ImagesDate.clear;
  }
}
