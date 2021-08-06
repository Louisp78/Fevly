import 'package:fevly/models/user.dart';
import 'package:flutter/cupertino.dart';

class GuestList extends ChangeNotifier {
  String _name;
  final List<User> _listOfUser;

  GuestList({required String name, required List<User> listOfUser})
      : _listOfUser = listOfUser,
        _name = name;

  // * GETTER
  int get numberOfGuests => _listOfUser.length;
  List<User> get listOfUser => _listOfUser;
  String get name => _name;

  // * SETTER
  set name(String newName) {
    _name = newName;
    notifyListeners();
  }

  set listOfUser(List<User> newList) {
    listOfUser = newList;
    notifyListeners();
  }

  void addGuest(User guest) {
    _listOfUser.add(guest);
    notifyListeners();
  }
}
