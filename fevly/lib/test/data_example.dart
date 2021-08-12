import 'package:fevly/models/badge.dart';
import 'package:fevly/models/guest_list.dart';
import 'package:fevly/models/party.dart';
import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';
import 'package:fevly/models/user.dart';

final User kCurrentUser = User(
  name: "Louis Place",
  pseudo: "llouisp",
  password: "loulou78",
  email: "placelouis@gmail.com",
  listOfBadges: badgeList1,
  level: 32,
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

List<Badge> badgeList1 = [
  Badge.sandal(badgeType: BadgeType.wood),
  Badge.sandal(badgeType: BadgeType.metal),
  Badge.sandal(badgeType: BadgeType.gold),
  Badge.sandal(badgeType: BadgeType.diamond),
  Badge.lyre(badgeType: BadgeType.gold),
  Badge.lyre(badgeType: BadgeType.ruby),
  Badge.bottle(badgeType: BadgeType.wood),
  Badge.bottle(badgeType: BadgeType.ruby),
  Badge.bottle(badgeType: BadgeType.special),
  Badge.rose(badgeType: BadgeType.metal),
  Badge.rose(badgeType: BadgeType.wood),
  Badge.spatula(badgeType: BadgeType.diamond),
  Badge.spatula(badgeType: BadgeType.wood),
];

List<Badge> badgeList2 = [
  Badge.rose(badgeType: BadgeType.gold),
  Badge.rose(badgeType: BadgeType.diamond),
  Badge.lyre(badgeType: BadgeType.wood),
  Badge.spatula(badgeType: BadgeType.ruby),
];

List<Badge> badgeList3 = [
  Badge.spatula(badgeType: BadgeType.wood),
  Badge.spatula(badgeType: BadgeType.gold),
  Badge.spatula(badgeType: BadgeType.ruby),
  Badge.spatula(badgeType: BadgeType.diamond),
  Badge.bottle(badgeType: BadgeType.metal),
];

List<Badge> badgeList4 = [
  Badge.lyre(badgeType: BadgeType.diamond),
  Badge.rose(badgeType: BadgeType.wood),
];

final listOfUsers1 = [
  User(
    name: "Vincent Libeskind",
    pseudo: "vinvin",
    password: "ehehehe",
    email: "vincent.libeskind@gmail.com",
    relationState: UserRelationState.unFriend,
  ),
  User(
    name: "Mathilde Fontaine",
    pseudo: "mathouFtn",
    password: "ehehehe",
    email: "vincent.libeskind@gmail.com",
    relationState: UserRelationState.unFriend,
  ),
  User(
    name: "Marie Fontaine",
    pseudo: "marieFtn",
    password: "ehehehe",
    email: "vincent.libeskind@gmail.com",
    relationState: UserRelationState.unFriend,
  ),
  User(
    name: "Elise Place",
    pseudo: "elisePl",
    password: "ehehehe",
    email: "vincent.libeskind@gmail.com",
    relationState: UserRelationState.unFriend,
  ),
];

final listOfFriends1 = [
  User(
    name: "Vincent Libeskind",
    pseudo: "vinvin",
    password: "ehehehe",
    email: "vincent.libeskind@gmail.com",
    relationState: UserRelationState.friend,
    listOfBadges: badgeList2,
  ),
  User(
    name: "Mathilde Fontaine",
    pseudo: "mathouFtn",
    password: "ehehehe",
    email: "vincent.libeskind@gmail.com",
    relationState: UserRelationState.friend,
    listOfBadges: badgeList3,
  ),
  User(
    name: "Marie Fontaine",
    pseudo: "marieFtn",
    password: "ehehehe",
    email: "vincent.libeskind@gmail.com",
    relationState: UserRelationState.friend,
    listOfBadges: badgeList4,
  ),
  User(
    name: "Elise Place",
    pseudo: "elisePl",
    password: "ehehehe",
    email: "vincent.libeskind@gmail.com",
    relationState: UserRelationState.friend,
    listOfBadges: badgeList2,
  ),
];

final listParties1 = [
  Party(
    address: "2 rue du Poteau, 75018, Paris",
    name: "Soirée exemple",
    description: "Une incroyable soirée.",
    listOfOrganizer: [
      User(
        name: "Louis Place",
        email: "placelouis@gmail.com",
        pseudo: "louisp78",
        password: "loulou78",
      ),
    ],
    guests: GuestList(name: "none", listOfUser: listOfUsers1),
    products: ProductList(listOfProduct: productList1, name: "none"),
  ),
  Party(
    address: "1 rue du Poteau, 75018, Paris",
    name: "Soirée exemple 2",
    description: "Une incroyable soirée.",
    listOfOrganizer: [
      User(
        name: "Louis Place",
        email: "placelouis@gmail.com",
        pseudo: "louisp78",
        password: "loulou78",
      ),
    ],
    guests: GuestList(name: "none", listOfUser: listOfUsers1),
    products: ProductList(listOfProduct: productList1, name: "none"),
  ),
];

List<GuestList> guestListList = [
  GuestList(name: "Liste d'invité 1", listOfUser: listOfUsers1),
  GuestList(name: "Liste d'invité 2", listOfUser: listOfUsers1),
];

List<GuestList> guestListListForDropdown = [
  GuestList(name: "Liste d'invité 1", listOfUser: listOfUsers1),
  GuestList(name: "Liste d'invité 2", listOfUser: listOfUsers1),
];

List<ProductList> productListListForDropdown = [
  ProductList(listOfProduct: productList1, name: "Liste de courses 1"),
  ProductList(listOfProduct: productList1, name: "Liste de courses 2"),
];

List<Product> productList1 = [
  Product(
      name: "Kronenbourg",
      price: 12,
      quantity: 1,
      image: "assets/products/pint_of_beer.svg",
      unit: QuantityUnit.pack),
  Product(
      name: "Pizza",
      price: 14,
      quantity: 4,
      image: "assets/products/pint_of_beer.svg",
      unit: QuantityUnit.part),
  Product(
      name: "Chips",
      price: 4.99,
      quantity: 2,
      image: "assets/products/pint_of_beer.svg",
      unit: QuantityUnit.paquet),
  Product(
    name: "PopCorn",
    price: 2.50,
    quantity: 1,
    image: "assets/products/pint_of_beer.svg",
    unit: QuantityUnit.paquet,
  ),
  Product(
      name: "Vodka",
      price: 17,
      quantity: 1,
      image: "assets/products/pint_of_beer.svg",
      unit: QuantityUnit.L),
];

List<ProductList> productListList = [
  ProductList(listOfProduct: productList1, name: "Liste de courses 1"),
  ProductList(listOfProduct: productList1, name: "Liste de courses 2")
];
