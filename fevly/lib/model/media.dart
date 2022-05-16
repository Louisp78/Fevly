import 'package:fevly/model/user_infos.dart';

class Media {
  final Object video;
  final UserInfos fromUser;
  final DateTime addedAt = DateTime.now();

  Media({
    required this.video,
    required this.fromUser,
  });
}
