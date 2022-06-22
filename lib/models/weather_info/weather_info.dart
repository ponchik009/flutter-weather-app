import 'package:json_annotation/json_annotation.dart';

part 'weather_info.g.dart';

@JsonSerializable()
class WeatherInfo {
  final String main, description;

  WeatherInfo({
    required this.main,
    required this.description,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherInfoToJson(this);
}
