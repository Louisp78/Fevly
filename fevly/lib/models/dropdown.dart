import 'package:flutter/cupertino.dart';

class Dropdown extends ChangeNotifier {
  bool isExpanded;

  Dropdown({required this.isExpanded});

  bool get expandState {
    return isExpanded;
  }

  set expandState(bool newValue) {
    isExpanded = newValue;
    notifyListeners();
  }
}
