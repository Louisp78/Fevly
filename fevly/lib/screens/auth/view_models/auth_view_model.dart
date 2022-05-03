import 'package:flutter/material.dart';

//$ CLASS
//$ ================================================
class AuthViewModel extends ChangeNotifier {
  AuthViewModel();

  Color _backgroundColor = Colors.transparent;
  double _width = 0.0;
  double _height = 0.0;

  var _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set backgroundColor(Color value) {
    _backgroundColor = value;
    notifyListeners();
  }

  void setwidthAndHeightAndColor(double height, double width, Color color) {
    _width = width;
    _height = height;
    _backgroundColor = color;
    notifyListeners();
  }

  Color get backgroundColor => _backgroundColor;
  double get width => _width;
  double get height => _height;
}
