import 'package:flutter/cupertino.dart';

class IsShopping extends ChangeNotifier {
  bool isClick;

  IsShopping({required this.isClick});

  bool get expandState {
    return isClick;
  }

  set expandState(bool newValue) {
    isClick = newValue;
    notifyListeners();
  }
}
