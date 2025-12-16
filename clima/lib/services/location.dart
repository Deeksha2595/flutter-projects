import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position pos = await Geolocator.getCurrentPosition();
      longitude = pos.longitude;
      latitude = pos.latitude;
    } catch (e) {
      print("caught: $e");
    }
  }
}
