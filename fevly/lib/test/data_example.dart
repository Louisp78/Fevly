import 'package:fevly/models/user.dart';
import 'data_badge.dart';
import 'data_guest_list.dart';
import 'data_product_list.dart';

//! WARNING : Ne jamais utiliser plusieurs fois une variable au sein de différent Object.
//! Exemple:
//! GuestList guestList1 = GuestList(name: "liste 1",listOfUser: listOfUser1);
//! GuestList guestList2 = GuestList(name: "liste 2",listOfUser: listOfUser1);

final User kCurrentUser = User(
  name: "Louis Place",
  pseudo: "llouisp",
  password: "loulou78",
  email: "placelouis@gmail.com",
  listOfBadges: badgeList1,
  level: 32,
  listOfGuestList: guestListListForDropdown,
  listOfProductList: productListListForDropdown,
);

final List<String> avatarsList = [
  "louis",
  "vincent",
  "louis",
  "vincent",
  "louis",
  "vincent",
  "louis",
  "vincent"
];
