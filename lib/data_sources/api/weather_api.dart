import 'package:dio/dio.dart';
import 'package:flutter_weather_app/models/forecast/forecast.dart';
import 'package:flutter_weather_app/models/weather/weather.dart';

class WeatherApi {
  final _dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      queryParameters: {"appid": "b44383604c938b64154d0be96b9b98e5"}));

  Future<Weather> getNowWeather(double latitude, double longitude) async {
    dynamic response = await _dio
        .get('weather', queryParameters: {'lon': longitude, 'lat': latitude});
    return Weather.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Forecast> getWeatherForFiveDays(
      double latitude, double longitude) async {
    dynamic response = await _dio
        .get('forecast', queryParameters: {'lon': longitude, 'lat': latitude});
    return Forecast.fromJson(response.data as Map<String, dynamic>);
  }
}
