import 'dart:async';

import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/create_party/view_model/location_section_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LocationSection extends StatelessWidget {
  LocationSection({required this.height});

  final Completer<GoogleMapController> _mapController = Completer();
  final double height;
  @override
  Widget build(BuildContext context) {
    final LocationSectionViewModel modelView =
        Provider.of<LocationSectionViewModel>(context);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      height: height,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: themeColor.onSurface, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            width: size.width * 0.45,
            padding: EdgeInsets.symmetric(
              horizontal: kBasicHorizontalPadding(size: size),
              vertical: kBasicVerticalPadding(size: size),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1 impasse du poirier au large, 78870,\nBailly',
                  style: textTheme.bodyLarge,
                ),
                Spacer(),
                CustomTextButton(
                  buttonSize: CustomTextButtonSize.small(),
                  press: () {},
                  prefixIcon: Icon(
                    Icons.map_rounded,
                    color: themeColor.background,
                  ),
                  text: 'Itineraire',
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => print('tap on map !'),
            child: Expanded(
              child: GoogleMap(
                zoomControlsEnabled: false,
                scrollGesturesEnabled: false,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
