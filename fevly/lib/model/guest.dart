import 'package:fevly/model/like.dart';
import 'package:fevly/model/user_infos.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum GuestStatus { present, absent, unknow }

class Guest extends UserInfos {
  final UserInfos userInfos;
  final List<Like> _likes = List.empty();
  GuestStatus status;

  Guest({
    required this.userInfos,
    this.status = GuestStatus.unknow,
    required String login,
    required User user,
    int xp = 0,
  }) : super(pseudo: login, user: user, xp: xp);

  List<Like> likes() {
    return List.unmodifiable(_likes);
  }

  bool addLike({required Like like}) {
    if (_likes.contains(like)) {
      return false;
    }

    _likes.add(like);
    return true;
  }
}
