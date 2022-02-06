import 'package:fevly/model/user.dart';

class Dancer extends User {

  Dancer({
    required String login,
    required String name,
    required String password,
    int xp = 0
  }) : super(login: login, name: name, password: password, xp: xp);

  @override
  String toString() {
    return "Dancer";
  }
}
