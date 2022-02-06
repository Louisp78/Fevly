import 'package:fevly/model/like.dart';
import 'package:fevly/model/user.dart';
enum GuestStatus
{
  present,
  absent,
  unknow
}
class Guest extends User {
  
  final User user;
  final List<Like> _likes = List.empty();
  GuestStatus status;

  Guest({
    required this.user,
    this.status = GuestStatus.unknow,

    required String name,
    required String login,
    required String password,
    int xp = 0,
  }) : super(name: name, login: login, password: password, xp: xp);

  List<Like> likes()
  {
    return List.unmodifiable(_likes);
  }

  bool addLike({required Like like})
  {
    if (_likes.contains(like)) {
      return false;
    } 

    _likes.add(like);
    return true;
  }
}
