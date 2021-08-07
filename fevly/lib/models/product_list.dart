import 'package:fevly/models/product.dart';
import 'package:flutter/cupertino.dart';

//$ CLASS
//$ ======================================

class ProductList extends ChangeNotifier {
  String _name;
  final List<Product> _listOfProduct;

  ProductList({required List<Product> listOfProduct, required String name})
      : _listOfProduct = listOfProduct,
        _name = name;

  //* GETTER
  int get numberOfProducts => _listOfProduct.length;
  List<Product> get listOfProduct => _listOfProduct;
  String get name => _name;

  //* SETTER
  set name(String newName) {
    _name = newName;
    notifyListeners();
  }

  set listOfProduct(List<Product> newList) {
    listOfProduct = newList;
    notifyListeners();
  }

  void addProduct(Product product) {
    _listOfProduct.add(product);
    notifyListeners();
  }
}
