import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/models/user.dart';

class Party {
  final String name, description, address;
  final List<User> organizer;
  final GuestList guests;
  final ProductList products;

  Party(
      {required this.name,
      required this.description,
      required this.address, 
      required this.organizer,
      required this.guests,
      required this.products})
      : assert(description.length < 1000, "Description too long."),
        assert(name.length < 21, "Name too long.");

  int get numberGuest {
    return guests.listOfUser.length;
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
