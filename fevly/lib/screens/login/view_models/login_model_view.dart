import 'package:flutter/foundation.dart';

//$ CLASS
//$ ==========================================
class LoginViewModel extends ChangeNotifier {
  String _password;
  String _login;

  LoginViewModel({String password = "", String login = ""})
      : _login = login,
        _password = password;

  //* GETTER
  String get password => _password;
  String get login => _login;
  bool get isFormValid => _login.isNotEmpty && _password.isNotEmpty;

  //* SETTER
  set login(String newLogin) {
    _login = newLogin;
    notifyListeners();
  }

  set password(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }
}
