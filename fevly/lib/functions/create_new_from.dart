import 'package:fevly/models/user.dart';

User createNewUserFrom({required User source}) => User(
      name: source.name,
      pseudo: source.pseudo,
      password: source.password,
      email: source.email,
      level: source.level,
      listOfBadges: source.listOfBadges,
      listOfFriends: source.listOfFriends,
      partyCounter: source.partyCounter,
      relationState: source.relationState,
    );
