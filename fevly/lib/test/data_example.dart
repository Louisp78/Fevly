import 'package:fevly/models/badge.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/party.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/models/user.dart';

List<Badge> badgeList1 = [
  Badge(
    name: "Sandale",
    badgeCategory: BadgeCategory.danse,
    badgeType: BadgeType.wood,
    image: "assets/badges/sandale_bois.svg",
  ),
  Badge(
    name: "Sandale",
    badgeCategory: BadgeCategory.danse,
    badgeType: BadgeType.metal,
    image: "assets/badges/sandale_metal.svg",
  ),
  Badge(
    name: "Sandale",
    badgeCategory: BadgeCategory.danse,
    badgeType: BadgeType.gold,
    image: "assets/badges/sandale_or.svg",
  ),
  Badge(
      name: "Sandale",
      badgeCategory: BadgeCategory.danse,
      badgeType: BadgeType.diamond,
      image: "assets/badges/sandale_diamant.svg"),
  Badge(
    name: "Lyre",
    badgeCategory: BadgeCategory.music,
    badgeType: BadgeType.gold,
    image: "assets/badges/lyre_or.svg",
  ),
  Badge(
      name: "Lyre",
      badgeCategory: BadgeCategory.music,
      badgeType: BadgeType.ruby,
      image: "assets/badges/lyre_rubis.svg"),
  Badge(
      name: "Bouteille",
      badgeCategory: BadgeCategory.drink,
      badgeType: BadgeType.wood,
      image: "assets/badges/bouteille_bois.svg"),
  Badge(
    name: "Bouteille",
    badgeCategory: BadgeCategory.drink,
    badgeType: BadgeType.ruby,
    image: "assets/badges/bouteille_rubis.svg",
  ),
  Badge(
      name: "Bouteille",
      badgeCategory: BadgeCategory.drink,
      badgeType: BadgeType.special,
      image: "assets/badges/bouteille_ambroisie.svg"),
  Badge(
      name: "Rose",
      badgeCategory: BadgeCategory.love,
      badgeType: BadgeType.metal,
      quantity: 10,
      image: "assets/badges/rose_metal.svg"),
  Badge(
      name: "Rose",
      quantity: 2,
      badgeCategory: BadgeCategory.love,
      badgeType: BadgeType.ruby,
      image: "assets/badges/rose_rubis.svg"),
  Badge(
      name: "Spatule",
      badgeCategory: BadgeCategory.cook,
      badgeType: BadgeType.wood,
      image: "assets/badges/spatules_bois.svg"),
  Badge(
      name: "Spatule",
      badgeCategory: BadgeCategory.cook,
      badgeType: BadgeType.diamond,
      image: "assets/badges/spatules_diamant.svg"),
];

final listOfUsers1 = [
  User(
      name: "Vincent Libeskind",
      pseudo: "vinvin",
      password: "ehehehe",
      email: "vincent.libeskind@gmail.com"),
  User(
      name: "Mathilde Fontaine",
      pseudo: "mathouFtn",
      password: "ehehehe",
      email: "vincent.libeskind@gmail.com"),
  User(
      name: "Marie Fontaine",
      pseudo: "marieFtn",
      password: "ehehehe",
      email: "vincent.libeskind@gmail.com"),
  User(
      name: "Elise Place",
      pseudo: "elisePl",
      password: "ehehehe",
      email: "vincent.libeskind@gmail.com"),
];

final listParties1 = [
  Party(
      name: "Soirée exemple",
      description: "Une incroyable soirée.",
      organizer: [
        User(
          name: "Louis Place",
          email: "placelouis@gmail.com",
          pseudo: "louisp78",
          password: "loulou78",
        ),
      ],
      guest: listOfUsers1),
  Party(
      name: "Soirée exemple 2",
      description: "Une incroyable soirée.",
      organizer: [
        User(
          name: "Louis Place",
          email: "placelouis@gmail.com",
          pseudo: "louisp78",
          password: "loulou78",
        ),
      ],
      guest: listOfUsers1),
];

List<GuestList> guestListList = [
  GuestList(name: "Liste d'invité 1", guests: listOfUsers1),
  GuestList(name: "Liste d'invité 2", guests: listOfUsers1),
];

List<GuestList> guestListListForDropdown = [
  GuestList(name: "Liste d'invité 1", guests: listOfUsers1),
  GuestList(name: "Liste d'invité 2", guests: listOfUsers1),
  GuestList(name: "Aucune", guests: [])
];

List<ProductList> productListListForDropdown = [
  ProductList(listOfProduct: productList1, name: "Liste de courses 1"),
  ProductList(listOfProduct: productList1, name: "Liste de courses 2"),
  ProductList(listOfProduct: [], name: "Aucune"),
];

List<Product> productList1 = [
  Product(name: "Pack de Kro", price: 12, quantity: 1),
  Product(name: "Pizza", price: 14, quantity: 4),
  Product(name: "Paquet de Chips", price: 4.99, quantity: 2),
  Product(name: "Paquet de PopCorn", price: 2.50, quantity: 1),
  Product(name: "Vodka", price: 17, quantity: 1),
];

List<ProductList> productListList = [
  ProductList(listOfProduct: productList1, name: "Liste de courses 1"),
  ProductList(listOfProduct: productList1, name: "Liste de courses 2")
];
