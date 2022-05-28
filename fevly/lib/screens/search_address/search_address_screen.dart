import 'dart:async';
import 'dart:math';

import 'package:fevly/DTOS/place.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/screens/search_address/view_model/search_address_model_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class SearchAddressScreen extends StatefulWidget {
  const SearchAddressScreen({Key? key}) : super(key: key);

  @override
  State<SearchAddressScreen> createState() => _SearchAddressScreenState();
}

class _SearchAddressScreenState extends State<SearchAddressScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  late StreamSubscription locationSubscription;
  Location currentLocation = Location();

  Set<Marker> markers = {};

  Place? lastPlace;

  @override
  void initState() {
    final SearchAddressModelView modelView =
        Provider.of<SearchAddressModelView>(context, listen: false);

    locationSubscription = modelView.selectedLocation.stream.listen((place) {
      _goToPlace(place: place);
      lastPlace = place;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SearchAddressModelView modelView =
        Provider.of<SearchAddressModelView>(context);
    final Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SafeArea(
      child: Scaffold(
        body: modelView.currentLocation != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(
                          height: size.height - padding.top - padding.bottom,
                          child: GoogleMap(
                            zoomControlsEnabled: false,
                            mapToolbarEnabled: false,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: false,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                modelView.currentLocation!.latitude,
                                modelView.currentLocation!.longitude,
                              ),
                              zoom: 14.0,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _mapController.complete(controller);
                            },
                            markers: markers,
                          ),
                        ),
                        if (modelView.predictions.isNotEmpty)
                          Consumer<SearchAddressModelView>(
                              builder: (context, modelView, _) {
                            return Positioned(
                              top: 40,
                              child: Container(
                                width: size.width * 0.9,
                                height: 300,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    backgroundBlendMode: BlendMode.darken),
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(top: 40),
                                  itemCount: modelView.predictions.length,
                                  itemBuilder: (context, index) => ListTile(
                                    title: Text(
                                      modelView.predictions[index].description,
                                      style: textTheme.bodyLarge,
                                    ),
                                    onTap: () {
                                      modelView.setSelectedLocation(
                                          modelView.predictions[index].placeId);
                                    },
                                  ),
                                ),
                              ),
                            );
                          }),
                        Positioned(
                          top: 10,
                          child: SizedBox(
                            width: size.width * 0.9,
                            child: TextField(
                              onEditingComplete: () {
                                modelView.predictions = [];
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              decoration: InputDecoration(
                                hintText: 'Rechercher une adresse',
                                hintStyle: textTheme.bodyLarge!
                                    .copyWith(color: themeColor.onBackground),
                              ),
                              onChanged: (value) {
                                modelView.searchPlaces(value);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 20,
                          child: CustomIconButton(
                              backgroundColor: themeColor.secondary,
                              size: const CustomIconButtonSize.normal(
                                  sizeContainer: 50),
                              press: () => _goCurrentLocation(),
                              icon: Icons.my_location_rounded),
                        ),
                        if (markers.isNotEmpty)
                          Positioned(
                            bottom: 20,
                            child: CustomTextButton(
                              press: () => Navigator.pop(context, lastPlace),
                              text: 'Valider',
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Future<void> _goToPlace({required Place place}) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(place.geometry.location.lat, place.geometry.location.lng),
        zoom: 14.0)));
    markers.clear();
    final rd = Random();
    markers.add(Marker(
      markerId: MarkerId(rd.nextInt(100).toString()),
      infoWindow: InfoWindow(title: place.name, snippet: 'Lieux de la soirée'),
      position:
          LatLng(place.geometry.location.lat, place.geometry.location.lng),
    ));
  }

  Future<void> _goCurrentLocation() async {
    var location = await currentLocation.getLocation();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0),
        zoom: 14.0)));
  }

  @override
  void dispose() {
    final SearchAddressModelView modelView =
        Provider.of<SearchAddressModelView>(context, listen: false);
    modelView.dispose();
    locationSubscription.cancel();
    super.dispose();
  }
}
