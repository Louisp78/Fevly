import 'package:fevly/models/user.dart';

class GuestList {
  final String name;
  List<User> guests;

  GuestList({required this.name, required this.guests});

  int get numberOfGuests {
    return guests.length;
  }
}
