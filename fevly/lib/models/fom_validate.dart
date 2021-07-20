import 'package:flutter/cupertino.dart';

class FormValidate extends ChangeNotifier {
  bool isFormValid = false;

  /// The current total price of all items (assuming all items cost $42).
  bool get validationState => isFormValid;

  set validationState(bool newBool) {
    isFormValid = newBool;
    notifyListeners();
  }
}
