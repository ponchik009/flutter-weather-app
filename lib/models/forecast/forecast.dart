import 'package:flutter_weather_app/models/city/city.dart';
import 'package:flutter_weather_app/models/forecast_item/forecast_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final List<ForecastItem> list;
  final City city;

  Forecast({required this.list, required this.city});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
