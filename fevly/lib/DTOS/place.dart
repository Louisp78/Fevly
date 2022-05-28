import 'package:fevly/DTOS/geometry.dart';

class Place {
  final Geometry geometry;
  final String name;
  final String vicinity;

  Place({
    required this.geometry,
    required this.name,
    required this.vicinity,
  });

  factory Place.fromJson(Map<dynamic, dynamic> json) {
    return Place(
      geometry: Geometry.fromJson(json['geometry'] as Map<dynamic, dynamic>),
      name: json['formatted_address'] as String,
      vicinity: json['vicinity'] as String,
    );
  }
}
