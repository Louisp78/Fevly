import 'package:fevly/model/user_infos.dart';

class Message {
  final CurrentUserInfos user;
  String content;
  DateTime atDate = DateTime.now();

  Message({required this.user, required this.content});
}
