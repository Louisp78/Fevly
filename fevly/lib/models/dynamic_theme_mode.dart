import 'package:flutter/material.dart';

/// a class to switch between light and dark mode
/// Using provider
class DynamicThemeMode extends ChangeNotifier 
{
  ThemeMode _mode = ThemeMode.light;
  
  ThemeMode get mode => _mode;

  set mode(ThemeMode newMode) 
  {
    _mode = newMode;
    notifyListeners();
  }
}
