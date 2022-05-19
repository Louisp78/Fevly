import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

class SearchBarGoogle extends StatelessWidget {
  const SearchBarGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlacesAutocompleteField(
            apiKey: 'AIzaSyCYtmTf8_jScCrocpjNUjjh368_MniVMoM',
            components: [Component(Component.country, 'fr')],
            key: key,
            location: Location(lat: 48.864716, lng: 2.349014),
            mode: Mode.overlay,
            sessionToken: ' dwed',
            language: 'fr',
            types: ['city']),
      ),
    );
  }
}
