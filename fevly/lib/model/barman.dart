import 'package:fevly/model/user_infos.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Barman extends UserInfos {
  Barman({required String login, required User user, int xp = 0})
      : super(pseudo: login, user: user, xp: xp);
}
