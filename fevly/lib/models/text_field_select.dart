import 'package:flutter/cupertino.dart';

class SearchField extends ChangeNotifier {
  bool isFormSelected = false;
  String textValue = "";
  List listOfObjects;

  SearchField({required this.listOfObjects});

  bool get selection {
    return isFormSelected;
  }

  set selection(bool newValue) {
    isFormSelected = newValue;
    notifyListeners();
  }

  String get searchText {
    return textValue;
  }

  set searchText(String newValue) {
    textValue = newValue;
    notifyListeners();
  }
}
