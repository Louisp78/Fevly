import 'package:fevly/models/user.dart';

class GuestList {
  final String name;
  List<User> listOfUser;

  GuestList({required this.name, required this.listOfUser});

  int get numberOfGuests {
    return listOfUser.length;
  }
}
