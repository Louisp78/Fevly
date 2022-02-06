import 'package:fevly/model/user.dart';

class Media {
  final Object video;
  final User fromUser;
  final DateTime addedAt = DateTime.now();

  Media({
    required this.video,
    required this.fromUser,
  });

}
