import 'dart:async';

import 'package:fevly/DTOS/place.dart';
import 'package:fevly/DTOS/place_search.dart';
import 'package:fevly/service/geolocator_service.dart';
import 'package:fevly/service/places_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class SearchAddressModelView extends ChangeNotifier {
  final geolocatorService = GeolocatorService();
  final placesService = PlacesService();

  // Variables
  Position? currentLocation;
  List<PlaceSearch> _predictions = [];
  List<PlaceSearch> get predictions => _predictions;
  set predictions(List<PlaceSearch> value) {
    _predictions = value;
    notifyListeners();
  }

  StreamController<Place> selectedLocation = StreamController<Place>();

  SearchAddressModelView() {
    setCurrentLocation();
  }

  Future<void> setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentPosition();
    notifyListeners();
  }

  Future<void> setSelectedLocation(String placeId) async {
    final place = await placesService.getPlace(placeId);
    selectedLocation.add(place);
    _predictions = [];
    notifyListeners();
  }

  Future<void> searchPlaces(String searchTerm) async {
    if (searchTerm.isEmpty) {
      _predictions = [];
      notifyListeners();
      return;
    }
    _predictions = await placesService.getAutoComplete(searchTerm);
    notifyListeners();
  }

  @override
  void dispose() {
    selectedLocation.close();
    super.dispose();
  }
}
