import 'package:flutter/cupertino.dart';

//? View Model
//$ CLASS
//$ =========================================

class MyListsModelView extends ChangeNotifier {
  bool _isExpanded;

  MyListsModelView({bool isExpanded = false}) : _isExpanded = isExpanded;

  //* GETTER
  bool get isExpanded => _isExpanded;

  //* SETTER
  set isExpanded(bool newValue) {
    _isExpanded = newValue;
    notifyListeners();
  }
}
