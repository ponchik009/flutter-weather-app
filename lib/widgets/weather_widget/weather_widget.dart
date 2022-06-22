import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather/weather.dart';
import 'package:flutter_weather_app/utils/utils.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key, required this.weather}) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              weather.name,
              style: const TextStyle(fontSize: 32),
            ),
            Icon(
              Utils.chooseWeatherIcon(weather.weather[0].main),
              size: 80,
            ),
            Column(
              children: [
                Text(
                    'Температура: ${Utils.toCelcius(weather.main.temp).toString()}°C'),
                Text(
                    'Ошущается: ${Utils.toCelcius(weather.main.feelsLike).toString()}°C'),
                Text(
                    'Минимум: ${Utils.toCelcius(weather.main.tempMin).toString()}°C'),
                Text(
                    'Максимум: ${Utils.toCelcius(weather.main.tempMax).toString()}°C'),
                Text('Влажность: ${weather.main.humidity.toString()}%'),
                Text(
                    'Атмсферное давление: ${weather.main.pressure.toString()} мм.рт.ст.'),
              ],
            )
          ],
        ));
  }
}
