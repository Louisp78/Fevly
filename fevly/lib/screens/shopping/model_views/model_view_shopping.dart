import 'package:fevly/models/product.dart';
import 'package:flutter/cupertino.dart';

class ModelViewShopping extends ChangeNotifier {
  int _count;
  String _textField;
  QuantityUnit? _category;
  bool _selection;

  ModelViewShopping(
      {int count = 0,
      String textField = "",
      QuantityUnit? category,
      bool selection = false})
      : _count = count,
        _textField = textField,
        _category = category,
        _selection = selection;

  int get count => _count;
  String get textField => _textField;
  QuantityUnit? get category => _category;
  bool get selection => _selection;

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  set textField(String value) {
    _textField = value;
    notifyListeners();
  }

  set category(QuantityUnit? value) {
    _category = value;
    notifyListeners();
  }

  set selection(bool value) {
    _selection = value;
    notifyListeners();
  }
}
