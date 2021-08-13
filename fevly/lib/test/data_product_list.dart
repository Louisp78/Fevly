import 'package:fevly/models/product.dart';
import 'package:fevly/models/product_list.dart';

final productListForParty1 =
    ProductList(listOfProduct: productList3, name: "Liste de courses party 1");

final productListForParty2 =
    ProductList(listOfProduct: productList3, name: "Liste de courses party 2");

List<ProductList> productListListForDropdown = [
  ProductList(listOfProduct: productList1, name: "Liste de courses 1"),
  ProductList(listOfProduct: productList2, name: "Liste de courses 2"),
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

List<Product> productList4 = [
  Product(
      name: "Kronenbourg",
      price: 12,
      quantity: 1,
      image: "assets/products/pint_of_beer.svg",
      unit: QuantityUnit.pack),
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
  ProductList(listOfProduct: productList2, name: "Liste de courses 2")
];
