
import 'package:fevly/model/user.dart';

enum QuantityUnit { none, L, cL, m, cm, pack, paquet, part }

class Product {

  final User fromUser;
  final String name;
  QuantityUnit unit;
  int quantity;

  Product({
    required this.fromUser,
    required this.name,
    required this.unit,
    this.quantity = 1,
  });

}
