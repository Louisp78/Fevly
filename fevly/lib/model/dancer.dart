import 'package:fevly/model/user_infos.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Dancer extends CurrentUserInfos {
  Dancer({required String login, required User user, int xp = 0})
      : super(pseudo: login, user: user, xp: xp);

  @override
  String toString() {
    return "Dancer";
  }
}
