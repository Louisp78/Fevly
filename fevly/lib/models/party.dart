import 'package:fevly/models/user.dart';

class Party {
  final String name, description;
  final List<User> organizer;
  final List<User> guest;

  Party(
      {required this.name,
      required this.description,
      required this.organizer,
      required this.guest})
      : assert(description.length < 1000, "Description too long."),
        assert(name.length < 21, "Name too long.");

  int get numberGuest {
    return guest.length;
  }

  int get numberOrganizer {
    return organizer.length;
  }

  @override
  String toString() {
    // TODO: implement toString
    return """
    name: $name,
    description: $description,
    numberGuest: $numberGuest,
    numberOrganizers : $numberOrganizer
    """;
  }
}
