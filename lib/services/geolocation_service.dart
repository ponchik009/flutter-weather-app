import 'package:geolocator/geolocator.dart';

class GeolocationService {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Сервис геолокации отключён');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
            'Разрешение на использование геопозиции не разрешено, я обиделся');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Разрешение на использование геопозиции не разрешено навсегда, я в депрессии');
    }

    return await Geolocator.getCurrentPosition();
  }
}
