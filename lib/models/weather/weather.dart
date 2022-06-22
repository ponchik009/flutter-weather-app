import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_weather_app/models/weather_info/weather_info.dart';
import 'package:flutter_weather_app/models/main_info/main_info.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String name;
  final List<WeatherInfo> weather;
  final MainInfo main;

  Weather({required this.main, required this.weather, required this.name});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
