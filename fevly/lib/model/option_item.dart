import 'package:flutter/material.dart';

class OptionItem {
  OptionItem(
      {required this.title, required this.prefixWidget, required this.onTap});

  final String title;
  final Widget prefixWidget;
  final GestureTapCallback onTap;
}
