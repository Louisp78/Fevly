import 'package:fevly/model/user_infos.dart';

class Message {
  final UserInfos user;
  String content;
  DateTime atDate = DateTime.now();

  Message({required this.user, required this.content});
}
