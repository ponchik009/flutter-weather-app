import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data_sources/api/weather_api.dart';
import 'package:flutter_weather_app/models/weather/weather.dart';
import 'package:flutter_weather_app/services/geolocation_service.dart';
import 'package:flutter_weather_app/widgets/retry_widget/retry_widget.dart';
import 'package:flutter_weather_app/widgets/weather_widget/weather_widget.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherApi = WeatherApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
              return FutureBuilder<Weather>(
                  future: weatherApi.getNowWeather(
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
                    return WeatherWidget(
                      weather: snapshot.data!,
                    );
                  });
            }),
      ),
    );
  }
}
