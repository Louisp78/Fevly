import 'package:flutter/cupertino.dart';

class ModelViewShopping extends ChangeNotifier{
  int _count;
  String _textField;
  String _isCategorySelected;
  bool _selection;

  ModelViewShopping(
    {
      int count = 0,
      String textField = "",
      String isCategorySelected = "",
      bool selection = false
    }
  )
  : _count = count,
  _textField = textField,
  _isCategorySelected = isCategorySelected,
  _selection = selection;

  int get count => _count;
  String get textField => _textField;
  String get isCategorySelected => _isCategorySelected;
  bool get selection => _selection;

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  set textField(String value) {
    _textField = value;
    notifyListeners();
  }

  set isCategorySelected(String value) {
    _isCategorySelected = value;
    notifyListeners();
  }

  set selection(bool value) {
    _selection = value;
    notifyListeners();
  }
}