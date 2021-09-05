import 'package:flutter/foundation.dart';

class TabControllerViewModel extends ChangeNotifier {
  int _index;
  TabControllerViewModel({required int index}) : _index = index;

  int get index => _index;

  set index(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
