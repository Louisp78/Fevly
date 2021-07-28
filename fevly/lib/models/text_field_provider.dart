import 'package:flutter/cupertino.dart';

class TextFieldProvider<T> extends ChangeNotifier {
  bool isFormSelected = false;
  String textValue = "";
  List? listOfObjects;
  T? value;

  TextFieldProvider({this.listOfObjects, this.value});

  bool get selection {
    return isFormSelected;
  }

  set selection(bool newValue) {
    isFormSelected = newValue;
    notifyListeners();
  }

  String get textValueOverride {
    return textValue;
  }

  set textValueOverride(String newValue) {
    textValue = newValue;
    notifyListeners();
  }

  T? get singleValue {
    return value;
  }

  set singleValue(T? newValue) {
    value = newValue;
    notifyListeners();
  }
}
