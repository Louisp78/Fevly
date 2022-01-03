import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

//$ CLASS
//$ ==================================

class Party extends ChangeNotifier {
  String _name;
  String _description;
  final List<User> _listOfOrganizer;
  GuestList _guests;
  ProductList _products;
  String _address;
  DateTime _startDate;
  DateTime _endDate;
  //! Pour l'instant c'est un String en attendant une implémentation de Google Maps
  String _location;
  String? _link;

  Party({
    required String name,
    required String address,
    required String description,
    required List<User> listOfOrganizer,
    required GuestList guests,
    required ProductList products,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    String? link,
  })  : _listOfOrganizer = listOfOrganizer,
        _guests = guests,
        _name = name,
        _description = description,
        _products = products,
        _address = address,
        _startDate = startDate,
        _endDate = endDate,
        _location = location,
        _link = link,
        assert(description.length < 1000, "Description too long."),
        assert(name.length < 21, "Name too long."),
        assert(listOfOrganizer.isNotEmpty,
            "a party must have at least one organizer.");

  // * GETTER

  List<User> get listOfOrganizer => _listOfOrganizer;
  int get guestsLength => _guests.numberOfGuests;
  int get listOfOrganizerLength => _listOfOrganizer.length;
  String get name => _name;
  String get description => _description;
  String get address => _address;
  ProductList get products => _products;
  GuestList get guests => _guests;
  DateTime get startDate => _startDate;
  DateTime get endDate => _endDate;
  String get location => _location;
  String? get link => _link;

  // * SETTER

  set listOfOrganizer(List<User> list) {
    listOfOrganizer = list;
    notifyListeners();
  }

  void addOrganizer({required User newOrganiser}) {
    _listOfOrganizer.add(newOrganiser);
    notifyListeners();
  }

  set name(String pName) {
    _name = pName;
    notifyListeners();
  }

  set description(String pDescription) {
    _description = pDescription;
    notifyListeners();
  }

  set address(String pAddress) {
    _address = pAddress;
    notifyListeners();
  }

  set products(ProductList list) {
    _products = list;
    notifyListeners();
  }

  set guests(GuestList list) {
    _guests = list;
    notifyListeners();
  }

  set startDate(DateTime newDate) {
    _startDate = newDate;
    notifyListeners();
  }

  set endDate(DateTime newDate) {
    _endDate = newDate;
    notifyListeners();
  }

  set location(String newLocation) {
    _location = newLocation;
    notifyListeners();
  }

  set link(String? pLink) {
    _link = pLink;
    notifyListeners();
  }

  String startDateFormat() => DateFormat('d MMMM', 'en_FR').format(startDate);

  // * OVERRIDE
  @override
  String toString() {
    return """
    name: $name,
    description: $description,
    numberGuest: $guestsLength,
    numberOrganizers : $listOfOrganizerLength
    """;
  }

  int numberOfDaysLeft() => DateTime.now().difference(startDate).inDays;
}
