import 'package:flutter/foundation.dart';

//$ CLASS
//$ ================================================
class SignInStep1ViewModel extends ChangeNotifier {
  String _email;
  String _password;
  String _confirmPassword;

  SignInStep1ViewModel(
      {String email = "", String password = "", String confirmPassword = ""})
      : _confirmPassword = confirmPassword,
        _email = email,
        _password = password;

  //* GETTER
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  //* SETTER
  set email(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  set password(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  set confirmPassword(String newConfirmPass) {
    _confirmPassword = newConfirmPass;
    notifyListeners();
  }

  //* METHOD
  bool formValidate() =>
      _email.isNotEmpty && _password.isNotEmpty && _confirmPassword.isNotEmpty;
}
