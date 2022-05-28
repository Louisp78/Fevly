import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  GeolocatorService();
  Future<Position> getCurrentPosition() async {
    // requestPermission first
    LocationPermission permission = await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
