import 'package:flutter/foundation.dart';

//$ CLASS
//$ ================================================
class SignInStep2ViewModel extends ChangeNotifier {
  String _name;
  String _pseudo;
  bool _isTermAccepted;

  SignInStep2ViewModel(
      {String email = "", String password = "", bool isTermAccepted = false})
      : _isTermAccepted = isTermAccepted,
        _name = email,
        _pseudo = password;

  //* GETTER
  String get name => _name;
  String get pseudo => _pseudo;
  bool get isTermAccepted => _isTermAccepted;

  //* SETTER
  set name(String newEmail) {
    _name = newEmail;
    notifyListeners();
  }

  set pseudo(String newPassword) {
    _pseudo = newPassword;
    notifyListeners();
  }

  set isTermAccepted(bool newBool) {
    _isTermAccepted = newBool;
    notifyListeners();
  }

  //* METHOD
  bool formValidate() =>
      _name.isNotEmpty && _pseudo.isNotEmpty && _isTermAccepted;
  void switchTerm() {
    _isTermAccepted = !_isTermAccepted;
    notifyListeners();
  }
}
