import 'package:json_annotation/json_annotation.dart';

part 'main_info.g.dart';

@JsonSerializable()
class MainInfo {
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'temp_min')
  final double tempMin;

  @JsonKey(name: 'temp_max')
  final double tempMax;

  final int pressure, humidity;

  MainInfo({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoToJson(this);
}
