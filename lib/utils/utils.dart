import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Utils {
  static int toCelcius(double kelvin) => (kelvin - 273.15).round();

  static IconData chooseWeatherIcon(String weather) {
    switch (weather) {
      case "Clouds":
        return WeatherIcons.day_cloudy;
      case "Rain":
        return WeatherIcons.day_rain;
      case "Snow":
        return WeatherIcons.day_snow;
      default:
        return Icons.question_mark;
    }
  }
}
