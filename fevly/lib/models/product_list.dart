import 'package:fevly/models/product.dart';

class ProductList {
  final String name;
  List<Product> listOfProduct;

  ProductList({required this.listOfProduct, required this.name});

  int get numberOfProducts {
    return listOfProduct.length;
  }
}
