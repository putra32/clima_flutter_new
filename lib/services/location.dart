import 'package:geolocator/geolocator.dart';

class Coordinat {
  Coordinat({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;
}

class Location {
  late Position _position;

  Future<Coordinat> getCurrentLocation() async {
    bool serviceEnable;
    LocationPermission permission;
    double lat;
    double long;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location services are disable');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
    } catch (e) {
      print(e);
    }
    lat = _position.latitude;
    long = _position.longitude;
    return Coordinat(latitude: lat, longitude: long);
  }
}
