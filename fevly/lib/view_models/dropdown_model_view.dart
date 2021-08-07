import 'package:flutter/cupertino.dart';

//? View Model
//$ CLASS
//$ =========================================

class DropDownModelView extends ChangeNotifier {
  bool _isExpanded;

  DropDownModelView({bool isExpanded = false}) : _isExpanded = isExpanded;

  //* GETTER
  bool get isExpanded => _isExpanded;

  //* SETTER
  set isExpanded(bool newValue) {
    _isExpanded = newValue;
    notifyListeners();
  }
}
