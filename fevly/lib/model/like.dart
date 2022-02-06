import 'package:fevly/model/user.dart';

class Like {

  final User fromUser;
  final DateTime atDate;

  Like({
    required this.fromUser,
    required this.atDate
  });
}
