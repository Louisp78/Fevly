import 'package:fevly/models/party.dart';
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
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 2",
    description: "Une incroyable soirée.",
    listOfOrganizer: listOfOrganizer2,
    guests: partyGuestList2,
    products: productListForParty2,
  ),
];
