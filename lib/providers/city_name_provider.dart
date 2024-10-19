import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/custom/database_exception.dart';
import 'package:weather_app/models/notification_model.dart';
import 'package:weather_app/services/database_helper.dart';

class CityNameProvider extends ChangeNotifier {
  String? cityName;

  void setCityName(String cityName) {
    this.cityName = cityName;
    print('cityyy ${this.cityName}');
    notifyListeners();
  }
}
