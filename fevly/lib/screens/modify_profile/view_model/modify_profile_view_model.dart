import 'package:flutter/material.dart';

class ModifyProfileViewModel extends ChangeNotifier {
  ModifyProfileViewModel();
  String? _requestedEmail;
  String? get requestedEmail => _requestedEmail;
  set requestedEmail(String? value) {
    _requestedEmail = value;
    notifyListeners();
  }
}
