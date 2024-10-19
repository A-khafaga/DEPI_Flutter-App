import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CityNameProvider extends ChangeNotifier {
  String? cityName;

  void setCityName(String cityName) {
    this.cityName = cityName;
    print('cityyy ${this.cityName}');
    notifyListeners();
  }
}
