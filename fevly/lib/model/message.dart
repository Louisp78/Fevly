import 'package:fevly/model/user.dart';

class Message {
  final User user;
  String content;
  DateTime atDate = DateTime.now();

  Message({
    required this.user,
    required this.content
  });
}
