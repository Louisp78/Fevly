import 'package:fevly/DTOS/place.dart';
import 'package:fevly/DTOS/place_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyAQHJEmmeJBXFlOL50WJGwYpJcZj4JpFwk';

  Future<List<PlaceSearch>> getAutoComplete(String search) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=fr&types=geocode&key=$key";

    final response = await http.get(Uri.parse(url));
    final json = convert.jsonDecode(response.body);
    final predictions = json['predictions'] as List;
    print('predictions : $predictions');

    return predictions
        .map(
          (prediction) =>
              PlaceSearch.fromJson(prediction as Map<String, dynamic>),
        )
        .toList();
  }

  Future<Place> getPlace(String placeId) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";

    final response = await http.get(Uri.parse(url));
    final json = convert.jsonDecode(response.body);
    return Place.fromJson(json['result'] as Map<String, dynamic>);
  }
}
