import 'package:fevly/model/user.dart';

class Barman extends User {

  Barman({
    required String login,
    required String name,
    required String password,
    int xp = 0
  }) : super(login: login, name: name, password: password, xp: xp);

}
