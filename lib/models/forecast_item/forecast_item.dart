import 'package:flutter_weather_app/models/main_info/main_info.dart';
import 'package:flutter_weather_app/models/weather_info/weather_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_item.g.dart';

@JsonSerializable()
class ForecastItem {
  final List<WeatherInfo> weather;
  final MainInfo main;
  @JsonKey(name: 'dt_txt')
  final String date;

  ForecastItem({required this.weather, required this.main, required this.date});

  factory ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastItemToJson(this);
}
