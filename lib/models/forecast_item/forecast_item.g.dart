// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastItem _$ForecastItemFromJson(Map<String, dynamic> json) => ForecastItem(
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: MainInfo.fromJson(json['main'] as Map<String, dynamic>),
      date: json['dt'] as int,
    );

Map<String, dynamic> _$ForecastItemToJson(ForecastItem instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
      'dt': instance.date,
    };
