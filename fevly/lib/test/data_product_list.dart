import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';

final productListForParty1 =
    ProductList(listOfProduct: productList3, name: "Soirée exemple 1");

final productListForParty2 =
    ProductList(listOfProduct: productList3, name: "Soirée exemple 2");

List<ProductList> productListListForDropdown = [
  ProductList(listOfProduct: productList1, name: "Liste de courses 1"),
  ProductList(listOfProduct: productList2, name: "Liste de courses 2"),
];

List<Product> productList1 = [
  Product(
      name: "Cocktail",
      price: 12,
      quantity: 1,
      image: "assets/drink/cocktail_1.svg",
      unit: QuantityUnit.part),
  Product(
      name: "Cocktail",
      price: 12,
      quantity: 13,
      image: "assets/drink/cocktail_2.svg",
      unit: QuantityUnit.part),
  Product(
      name: "Cocktail",
      price: 12,
      quantity: 7,
      image: "assets/drink/cocktail_3.svg",
      unit: QuantityUnit.part),
  Product(
      name: "Cocktail",
      price: 12,
      quantity: 3,
      image: "assets/drink/cocktail_4.svg",
      unit: QuantityUnit.part),
  Product(
      name: "Pizza",
      price: 14,
      quantity: 4,
      image: "assets/food/pizza_slice.svg",
      unit: QuantityUnit.pack),
  Product(
      name: "Nachos",
      price: 4.99,
      quantity: 2,
      image: "assets/food/nachos.svg",
      unit: QuantityUnit.part),
  Product(
    name: "PopCorn",
    price: 2.50,
    quantity: 2,
    image: "assets/food/popcorn.svg",
    unit: QuantityUnit.paquet,
  ),
  Product(
      name: "Vodka",
      price: 17,
      quantity: 2,
      image: "assets/drink/vodka_1.svg",
      unit: QuantityUnit.L),
  Product(
      name: "Long Island",
      price: 17,
      quantity: 5,
      image: "assets/drink/long_island.svg",
      unit: QuantityUnit.part),
  Product(
      name: "Cookie",
      price: 17,
      quantity: 20,
      image: "assets/food/cookie.svg",
      unit: QuantityUnit.paquet),
];
List<Product> productList2 = [
  Product(
      name: "Kronenbourg",
      price: 12,
      quantity: 1,
      image: "assets/products/pint_of_beer.svg",
      unit: QuantityUnit.pack),
  Product(
      name: "Vodka",
      price: 17,
      quantity: 1,
      image: "assets/products/pint_of_beer.svg",
      unit: QuantityUnit.L),
];

List<Product> productList3 = [
  Product(
      name: "Rum",
      price: 12,
      quantity: 2,
      image: "assets/drink/rum.svg",
      unit: QuantityUnit.L),
  Product(
      name: "Vodka",
      price: 17,
      quantity: 1,
      image: "assets/drink/vodka_2.svg",
      unit: QuantityUnit.L),
];

List<Product> productList4 = [
  Product(
      name: "Kronenbourg",
      price: 12,
      quantity: 50,
      image: "assets/drink/beer.svg",
      unit: QuantityUnit.cL),
  Product(
    name: "PopCorn",
    price: 2.50,
    quantity: 1,
    image: "assets/food/popcorn.svg",
    unit: QuantityUnit.paquet,
  ),
  Product(
      name: "Vodka",
      price: 17,
      quantity: 1,
      image: "assets/drink/vodka_1.svg",
      unit: QuantityUnit.L),
];

List<ProductList> productListList = [
  ProductList(listOfProduct: productList1, name: "Liste de courses 1"),
  ProductList(listOfProduct: productList2, name: "Liste de courses 2")
];
