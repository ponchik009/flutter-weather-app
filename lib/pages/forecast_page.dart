import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data_sources/api/weather_api.dart';
import 'package:flutter_weather_app/models/forecast/forecast.dart';
import 'package:flutter_weather_app/models/forecast_item/forecast_item.dart';
import 'package:flutter_weather_app/widgets/forecast_widget/forecast_widget.dart';
import 'package:geolocator/geolocator.dart';

import '../services/geolocation_service.dart';
import '../widgets/retry_widget/retry_widget.dart';

class ForecastPageRoute extends MaterialPageRoute {
  ForecastPageRoute({required this.dependency})
      : super(
            builder: (context) => _ForecastPage(
                  title: dependency.title,
                ),
            settings: RouteSettings(arguments: dependency));

  final ForecastPageDependency dependency;
}

class ForecastPageDependency {
  ForecastPageDependency({required this.title, required this.weatherApi});

  final WeatherApi weatherApi;
  final String title;
}

class _ForecastPage extends StatefulWidget {
  const _ForecastPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<_ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<_ForecastPage> {
  @override
  Widget build(BuildContext context) {
    final weatherApi =
        (ModalRoute.of(context)!.settings.arguments as ForecastPageDependency)
            .weatherApi;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: FutureBuilder<Position>(
              future: GeolocationService.determinePosition(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return RetryWidget(
                      text: snapshot.error.toString(),
                      retry: () {
                        setState(() {});
                      });
                }
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return FutureBuilder<Forecast>(
                    future: weatherApi.getWeatherForFiveDays(
                        snapshot.data!.latitude, snapshot.data!.longitude),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return RetryWidget(
                            text: snapshot.error.toString(),
                            retry: () {
                              setState(() {});
                            });
                      }
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return ForecastWidget(
                        forecast: snapshot.data!,
                      );
                    });
              })),
    );
  }
}
