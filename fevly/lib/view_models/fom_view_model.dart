import 'package:flutter/cupertino.dart';

//? View Model
//$ CLASS
//$ =========================================

class FormViewModel extends ChangeNotifier {
  final bool _isFormValid;
  final bool _isTermOfUseAccepted;

  FormViewModel({bool isFormValid = false, bool isTermOfUseAccepted = false})
      : _isFormValid = isFormValid,
        _isTermOfUseAccepted = isTermOfUseAccepted;

  //* GETTER
  bool get isFormValid => _isFormValid;
  bool get isTermOfUseAccepted => _isTermOfUseAccepted;
  bool get validation => isFormValid && isTermOfUseAccepted;

  //* SETTER
  set isFormValid(bool newValue) {
    isFormValid = newValue;
    notifyListeners();
  }

  set isTermOfUseAccepted(bool newValue) {
    isTermOfUseAccepted = newValue;
    notifyListeners();
  }
}
