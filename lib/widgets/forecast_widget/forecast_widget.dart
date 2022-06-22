import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/forecast/forecast.dart';
import 'package:flutter_weather_app/models/weather/weather.dart';

import '../../utils/utils.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({Key? key, required this.forecast}) : super(key: key);

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(forecast.city.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30)),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                    title: Text(forecast.list[index].date),
                    subtitle: ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 300),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Utils.chooseWeatherIcon(
                                forecast.list[index].weather[0].main),
                            size: 80,
                          ),
                          Column(
                            children: [
                              Text(
                                  'Температура: ${Utils.toCelcius(forecast.list[index].main.temp).toString()}°C'),
                              Text(
                                  'Ошущается: ${Utils.toCelcius(forecast.list[index].main.feelsLike).toString()}°C'),
                              Text(
                                  'Минимум: ${Utils.toCelcius(forecast.list[index].main.tempMin).toString()}°C'),
                              Text(
                                  'Максимум: ${Utils.toCelcius(forecast.list[index].main.tempMax).toString()}°C'),
                              Text(
                                  'Влажность: ${forecast.list[index].main.humidity.toString()}%'),
                              Text(
                                  'Атмсферное давление: ${forecast.list[index].main.pressure.toString()} мм.рт.ст.'),
                            ],
                          )
                        ],
                      ),
                    )),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: forecast.list.length))
      ],
    ));
  }
}
