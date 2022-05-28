import 'package:fevly/service/geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationSectionViewModel extends ChangeNotifier {
  Position? currentLocation;
  final geolocatorService = GeolocatorService();

  Future<void> setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentPosition();
    notifyListeners();
  }

  LocationSectionViewModel() {
    setCurrentLocation();
  }
}
