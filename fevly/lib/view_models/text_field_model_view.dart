import 'package:flutter/cupertino.dart';

//$ CLASS
//$ ================================================

class TextFieldModelView<T> extends ChangeNotifier {
  bool isFormSelected = false;
  String _textValue = "";
  List? listOfObjects;
  T? _value;

  TextFieldModelView({this.listOfObjects, T? value}) : _value = value;

  //* GETTER
  bool get selection => isFormSelected;

  String get textValue => _textValue;

  T? get value => _value;

  int get listOfObjectsLenght => listOfObjects!.length;

  //* SETTER
  set selection(bool newValue) {
    isFormSelected = newValue;
    notifyListeners();
  }

  set textValue(String newValue) {
    _textValue = newValue;
    notifyListeners();
  }

  set value(T? newValue) {
    _value = newValue;
    notifyListeners();
  }
}
