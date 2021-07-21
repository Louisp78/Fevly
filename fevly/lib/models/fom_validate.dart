import 'package:flutter/cupertino.dart';

class FormValidate extends ChangeNotifier {
  bool isFormValid = false;
  bool isTermOfUseAccepted = false;

  bool get formValid {
    return isFormValid;
  }

  set formValid(bool newBool) {
    isFormValid = newBool;
    notifyListeners();
  }

  bool get termOfUse {
    return isTermOfUseAccepted;
  }

  set termOfUse(bool newBool) {
    isTermOfUseAccepted = newBool;
    notifyListeners();
  }

  bool get validation {
    return isFormValid && isTermOfUseAccepted;
  }
}
