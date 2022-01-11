import 'package:fevly/models/guest_list.dart';
import 'package:fevly/test_data/data_list_of_user.dart';

final GuestList partyGuestList1 =
    GuestList(name: "Party GuestList1", listOfUser: listOfUsers3);
final GuestList partyGuestList2 =
    GuestList(name: "Party GuestList2", listOfUser: listOfUsers4);

List<GuestList> guestListListForDropdown = [
  GuestList(name: "Liste d'invité 1", listOfUser: listOfUsers2),
  GuestList(name: "Liste d'invité 2", listOfUser: listOfUsers1),
];

List<GuestList> guestListList = [
  GuestList(name: "Liste d'invité 1", listOfUser: listOfUsers1),
  GuestList(name: "Liste d'invité 2", listOfUser: listOfUsers1),
];
