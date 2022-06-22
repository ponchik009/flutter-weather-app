import 'dart:convert';
import 'package:flutter_weather_app/models/weather/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherLocalDataSourse {
  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Weather? get() {
    final json = prefs.getString('weather');
    return json == null ? null : Weather.fromJson(jsonDecode(json));
  }

  void set(Weather global) {
    prefs.setString('weather', jsonEncode(global.toJson()));
  }
}
