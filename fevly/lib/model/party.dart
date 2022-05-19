import 'package:fevly/model/chat.dart';
import 'package:fevly/model/guest.dart';
import 'package:fevly/model/location.dart';
import 'package:fevly/model/user_infos.dart';
import 'package:fevly/models/product.dart';

class Party {
  String name;
  CurrentUserInfos organizer;
  DateTime startDate;
  DateTime endDate;
  Location location;
  final List<Guest> _guests = List.empty();
  final List<Product> _products = List.empty();
  final Chat chat;

  Party(
      {required this.name,
      required this.organizer,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.chat});

  //* Getters
  /// Return an unmodifiable list of guests
  /// Look at addGuest for mutation
  List<Guest> guests() {
    return List.unmodifiable(_guests);
  }

  /// Return an unmodifiable list of products
  /// Look at addProduct for mutation
  List<Product> products() {
    return List.unmodifiable(_products);
  }

  //* Methods
  bool addGuest(Guest guest) {
    if (_guests.contains(guest)) {
      return false;
    }
    _guests.add(guest);
    return true;
  }

  bool addProduct(Product product) {
    _products.add(product);
    return true;
  }

  Duration getDuration() {
    return endDate.difference(startDate);
  }

  int getNumberOfDayLeft() {
    return startDate.difference(DateTime.now()).inDays;
  }
}
