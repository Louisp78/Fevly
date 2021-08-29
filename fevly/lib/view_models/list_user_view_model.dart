import 'package:fevly/models/user.dart';
import 'package:flutter/foundation.dart';

class ListUserViewModel extends ChangeNotifier {
  List<User> _list;
  ListUserViewModel({required List<User> list}) : _list = list;

  //* GETTER
  List<User> get list => _list;

  //* SETTER
  set list(List<User> newList) {
    _list = newList;
    notifyListeners();
  }

  //* METHOD
  void addToList(User user) {
    _list.add(user);
    notifyListeners();
  }

  void removeFromList(User user) {
    _list.removeWhere((element) => element.pseudo == user.pseudo);
    notifyListeners();
  }
}
