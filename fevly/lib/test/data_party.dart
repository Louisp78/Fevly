import 'package:fevly/models/party.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/test/data_example.dart';
import 'package:fevly/test/data_guest_list.dart';
import 'package:fevly/test/data_product_list.dart';

import 'data_list_of_user.dart';

final listParties1 = [
  Party(
    address: "2 rue du Poteau, 75018, Paris",
    name: "Soirée exemple",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfOrganizer1,
    guests: partyGuestList1,
    products: productListForParty1,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
    link: "www.google.fr"
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 2",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfOrganizer2,
    guests: partyGuestList2,
    products: productListForParty2,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
    link: "www.google.fr"
  ),
];

final List<Party> partiesInvite = [
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 1",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfFriends1,
    guests: partyGuestList2,
    products: productListForParty2,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 2",
    description: "Une incroyable soirée.",
    listOfOrganizer: [kCurrentUser],
    guests: partyGuestList2,
    products: productListForParty2,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 3",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfOrganizer1,
    guests: partyGuestList2,
    products: productListForParty2,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 4",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfUsers3,
    guests: partyGuestList2,
    products: productListForParty2,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
  ),
];

final List<Party> partiesAccepted = [
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 1",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfUsers4,
    guests: partyGuestList2,
    products: productListForParty1,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 2",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfFriends1,
    guests: partyGuestList2,
    products: productListForParty2,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 3",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfOrganizer2,
    guests: partyGuestList2,
    products:
        ProductList(name: "Soirée exemple 3", listOfProduct: productList1),
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 4",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfOrganizer1,
    guests: partyGuestList2,
    products: productListForParty2,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    location: "Paris",
  ),
];
