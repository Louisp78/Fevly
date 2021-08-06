import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/models/user.dart';
import 'package:flutter/cupertino.dart';


//$ CLASS
//$ ==================================

class Party extends ChangeNotifier {
  String _name, _description;
  final List<User> _listOfOrganizer;
  GuestList _guests;
  ProductList _products;

  Party({
    required String name,
    required String description,
    required List<User> listOfOrganizer,
    required GuestList guests,
    required ProductList products,
  })  : _listOfOrganizer = listOfOrganizer,
        _guests = guests,
        _name = name,
        _description = description,
        _products = products,
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
  ProductList get products => _products;
  GuestList get guests => _guests;

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

  set products(ProductList list) {
    _products = list;
    notifyListeners();

  }

  set guests(GuestList list) {
    _guests = list;
    notifyListeners();
  }

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
}
